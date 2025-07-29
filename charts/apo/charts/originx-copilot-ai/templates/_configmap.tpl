{{- define "originx-copilot-ai.config" -}}
llm_type: {{ .Values.config.configmap.llmType }}
{{ toYaml .Values.config.configmap.llmConfig }}

apo_backend: {{ tpl .Values.config.apoBackendUrl . }}
polaris_backend: {{ tpl .Values.config.apoPolarisBackendUrl . }}
originx_backend: {{ tpl .Values.config.originxRootCauseInferUrl . }}

{{- if eq .Values.global.language "en" }}
language: en
{{- else if eq .Values.global.language "zh" }}
language: zh
{{- end }}
{{- end }}

{{- define "originx-copilot-ai.prompt" -}}
zh:
  system: |
    你是一个智能推理助手,你的任务是根据用户提供的数据和用户提供的规则，按照要求分析出根因节点。

  topology: |
    #背景#
    这里有一个微服务拓扑图，每层有节点名。上层节点和下层节点构成上游与下游关系，且为上游调用下游。请根据数据内容记住上下游服务关系的拓扑结构。
    #注意#
    拓扑数据信息
    1.每层节点名称最前面的数字为层数,如数字0代表该节点是入口服务节点。数字越大，层数越深，同时针对非入口节点，往上找��的第一个层级比它小1的节点为其上游节点。
    2.一个节点可能有多个下游节点，同时它还可能被多个上游节点调用，请不要遗漏任何节点
    3.不要创造不存在的上下游调用关系，不要弄反上下游关系，也不要遗漏上下游调用关系，拓扑结构中不要出现环，不要联想到其他东西。
    4.所有节点按照名称标识，节点名称比较长，请不要压缩任何节点名称。(节点名称中不要带有层级信息，如1──开头的信息)
    拓扑图数据会在之后给出。
    #输出#
    已记住拓扑数据信息格式，回答简洁简短。

  alert: |
    #背景#
    拓扑数据中每个节点后如果有告警事件，会在节点名称后面附带告警事件, 没有告警事件的节点名称后面是空的。
    #注意#
    告警事件为JSON格式数据，含义如下:
    第一层的KEY为告警事件的类型,是数字，1接口层告警,2为容器异常,3为基础设施异常,4为网络程序异常,5为错误异常。
    第二层的KEY为该类型告警数据信息，含义如下
    - add新增告警事件数
    - duplicate重复告警事件数
    - resolve已经解决告警事件数
    - keep 目前还存留告警事件数
    - firstTime该类型告警事件第一次发生时间
    - lastTime该类型告警事件最后一次发生时间
    - resolveTime解决告警的时间(告警已解决才有)
    #处理过程#
    请仔细处理数据,如处理每行的节点(节点名称从层数后面的--符号后开始,节点名称中不要带有层级信息，如1──开头的信息)，记录的节点名称一定要完整。回答记住数据,��用回答其他内容。
    有告警事件的节点定义是节点出现在JSON数据中，没有告警事件的节点定义是节点未出现在JSON数据中
    #输出#
    已记住这些告警事件，回答简洁简短。
    #拓扑图和告警事件#
    拓扑图和告警事件数据如下

  rule: |
      #目的#
      请根据上文提供的微服务拓扑图和每个节点的告警事件, 之后会提供以一个个规则找出符合规则的根因节点。
      #根因节点推导流程#
      - 根据告警事件中异常类型和发生次数，记录异常事件从下游往上游传递的顺序
      - 每次给出一个规则后，从上一个规则中给出的疑似根因节点中继续排除符合规则的节点，不用从头开始推导。不用附带完整数据，总结数据即可
      #注意#
      在拓扑中，一个上游可能有多个下游节点，多个下游视为同级节点。如果同级节点中的服务都满足异常向上传递，那么这些下游节点都可认为是根因，且排除上游节点，不要遗漏节点。同时记得一定要排除入口节点。
      整个过程中一定要使用节点的完整名称！！！不要省略,同时节点名称中的符号不能省略，和原始数据保持一致，节点名称不要有0──之类的层数信息。
      #输出#
      记住推导流程，回答简洁简短。
  rules:
    - 规则1
      请从拓扑数据和告警事件数据中，列出没有告警事件的节点名称，将没有告警事件的节点排除，同时列出有告警事件的节点名称，将其标识为疑似节点。
      '输出'
      符合当前规则的节点列表，简洁而短，且节点名称需要完整，和源数据保持一致，不可以省略
    - 规则2
      请按如下规则分析告警拓扑并输出疑似根因节点名称列表，节点名称要完整不要省略，输出要简洁：
      【规则目标】
      从应用接口层告警出发，沿业务入口的拓扑结构，从上游向下游依次追踪，判断哪些节点是疑似根因。
      【关键定义】
      节点前面的数字 = 节点拓扑深度，数字越大表示越下游。
      下游节点 = 深度更大的节点，直到遇到相同深度为止。
      同一深度的节点是兄弟节点，没有上下游关系。
      最下游节点 = 所有疑似根因中，拓扑深度最大的那个。
      【追踪规则】
      1. 从有“接口层告警”的节点出发，向其下游（即更大数字，直到遇到相同数字）追踪。
      2. 遇到没有“接口层告警”的节点，停止追踪该路径，排除该节点，返回上一层继续。
      3. 若当前节点存在接口层告警，则继续追踪其下游节点。
     【判断疑似根因的条件】
      在追踪过程中，符合以下任意一条即为疑似根因节点：
      该节点有其它类型的告警（非接口层）
      它的下游节点（即比它深，但在遇到相同数字前）中没有相同类型告警
      它是当前路径中最深的节点，且有接口层告警
      如果该节点有1或5类型接口告警：
        且它也有其他类型告警 => 疑似根因
        否则，下游节点中也没有1/5类型接口告警 => 疑似根因
      【优先候选】
       如果某个疑似根因节点的深度 = 所有疑似根因节点中最大深度，则它为优先候选。
      【输出】
       仅输出所有符合条件的“疑似根因节点名称”列表
       不要省略节点名，不要输出解释内容
    - 规则3
      根因节点需要满足异常从该节点开始向上游传递递，同时该类型异常告警事件是持续发生的，而不是偶发的。
      '注意'
      如果接口层类型的告警既有新增又有解决，且该已解决告警事件时间和告警事件第一次发生时间接近，该节点可认为是偶发。
      但是接口层类型告警存在存留告警，该节点应做为疑似根因节点。
      节点的异常告警是偶发，那么它不应该被认定为根因节点
      '输出'
      符合当前规则的节点列表，简洁而短，且节点名称需要完整，和源数据保持一致，不可以省略
    - 规则4
      如果某个节点发生异常，但是上游节点未发生接口异常告警，可以将这个节点及其分支全部排除。
      '输出'
      符合当前规则的节点列表，简洁而短，且节点名称需要完整，和源数据保持一致，不可以省略

  summary_node: |
    #目的#
    汇总之前的节点信息，返回一个满足最多规则的根因的节点和最多三个疑似根因节点。
    #注意#
    不需要其他任何额外信息,且节点名称一定完整，和源数据保持一致。
    最终的根因节点一定不能是入口节点（拓扑图中最上层的节点）。
    节点名称必须完整，和拓扑数据保持一致，且节点名称前后不要用任何特殊符号，如空格, *, `等符号。
    xxx后面必须跟着节点两个字,不要直接给出xxx.
    #输出#
    输出为JSON格式,仅有包含字段nodeName和otherNodeName,josn内的节点名必须完整,保留原有的任何符号，不可省略
    nodeName给出造成根因的节点。(不要给出无,必须有一个节点如造成根因的是A节点)
    otherNodeName给出疑似根因节点的列表。(列表内可以有多个节点,但是不能和造成根因节点相同)

en:
  system: |
    You are an intelligent reasoning assistant. Your task is to analyze the root cause nodes based on the data and rules provided by the user, and deliver the results as requested.

  topology: |
    #background#
    Here is a microservice topology diagram with node names at each layer. Upper-layer nodes and lower-layer nodes form upstream and downstream relationships, where the upstream calls the downstream. Please remember the topology structure based on the provided data.
    #attention#
    topology data information:
    1.The number at the beginning of each node name indicates its layer. For example, a node with the number "0" is the entry service node. The larger the number, the deeper the layer. For non-entry nodes, the first node with a smaller number upwards is considered its upstream node.
    2.A node may have multiple downstream nodes and may also be called by multiple upstream nodes. Please do not overlook any nodes.
    3.Do not create non-existent upstream-downstream relationships, do not reverse the relationships, and do not miss any upstream-downstream calls. There should be no loops in the topology structure, and do not introduce any unrelated concepts.
    4.Node names are relatively long, so do not abbreviate them (do not include layer information such as "1--" at the beginning of the node name).
    The topology data will be provided later.
    #output#
    The topology data information has been memorized. Please respond concisely.

  alert: |
    #background#
    For each node in the topology data, if there is an alarm event, the alarm event will be appended to the node's name. Nodes without any alarm events will have no additional information after their name.
    #attention#
    The alarm event data is in JSON format, and its meaning is as follows:
    The first level's key represents the type of alarm event, represented by a number:
    1: Interface-level alarm
    2: Container anomaly
    3: Infrastructure anomaly
    4: Network program anomaly
    5: Error anomaly
    The second level's key contains information specific to that alarm type, with the following fields:
    - add: Number of newly added alarm events
    - duplicate: Number of duplicate alarm events
    - resolve: Number of resolved alarm events
    - keep: Number of unresolved alarm events
    - firstTime: The first occurrence time of this type of alarm event
    - lastTime: The last occurrence time of this type of alarm event
    - resolveTime: The time when the alarm event was resolved (only present if the alarm has been resolved)
    #processing#
    Please process the data carefully. For each node (with the node name starting after the number-- symbol), ensure that the node name is recorded fully and correctly. Do not include other content in the response, only the necessary data.
    Nodes with alarm events are defined as those that appear in the JSON data.
    Nodes without alarm events are defined as those that do not appear in the JSON data.
    #output#
    I have remembered the alarm events. Please respond concisely and briefly.
    #Topology and Alarm Event Data#
    The topology and alarm event data are as follows:

  rule: |
    #objective#
    Based on the provided microservice topology diagram and the alarm events for each node, you will be given a set of rules to identify the root cause nodes that match each rule.
    #rootcause node process#
    - Record the sequence in which abnormal events propagate from downstream to upstream, based on the type of abnormality and its occurrence frequency in the alarm events.
    - For each rule provided, continue filtering out the nodes that meet the rule from the suspected root cause nodes identified in the previous rule. Do not restart the entire derivation process from scratch. Only summarize the relevant data.
    #attention#
    In the topology, an upstream node may have multiple downstream nodes. These downstream nodes are considered at the same level. If all services of these same-level nodes satisfy the criteria for abnormality propagation upstream, all these downstream nodes can be considered as potential root causes. Exclude the upstream node and ensure that no node is missed.
    Always exclude entry nodes from the analysis.
    Use the full names of the nodes throughout the process,do not abbreviate.
    #output#
    Follow the derivation process carefully and provide concise and brief answers.

  rules:
    - rule1
      Please identify and list the node names from the topology data and alarm event data that do not have any associated alarm events. Exclude these nodes from the list. Then, list the node names that have alarm events and label them as suspicious nodes.
      'output'
      The output should be a concise and clear list of nodes that meet the criteria, with full node names included (do not abbreviate or omit any details).
    - rule2
      Starting from the application interface layer alerts, trace downstream from each node along the business entry topology, following the direction from upstream to downstream (use the topology data and do not confuse upstream and downstream). Please provide the inference process.
      During the tracing process, analyze each node as follows
        If there is an interface layer alert, continue tracing downstream to the dependent nodes. This node is considered a potential root cause in two cases
        1.The node has other types of alerts.
        2.All downstream nodes of this node do not have type 1 interface alerts.
          In other cases, the node is not considered a potential root cause.
        If no interface layer alert is found, stop the trace and return to the previous level node. The current node is excluded from further analysis.
      During the tracing process, for each node with a type 1 interface alert
        Check if there are other types of alerts (e.g., application layer, container layer, infrastructure layer alerts). If such alerts exist, the node is considered a potential root cause. Record it and continue analyzing downstream nodes.
        If no other alerts are present, and all downstream nodes do not have type 1 interface alerts, then this node is considered a potential root cause.
        If the node is a leaf node (i.e., there are no further downstream dependencies), and it has a type 1 interface alert, the node is also considered a potential root cause.
      Definition of Leaf Node:A node that has no further downstream dependencies in the dependency chain. If a leaf node has an alert, it is a priority candidate for being the root cause.
      'output'
      The output should be a concise and clear list of nodes that meet the criteria, with full node names included (do not abbreviate or omit any details).
    - rule3
      The root cause node must meet the condition that the anomaly starts from this node and propagates upstream. Additionally, the associated anomaly alert event must be continuous, rather than sporadic.
      'attention'
      If an interface layer alert has both new and resolved events, and the resolution time is close to the initial occurrence time of the alert, the node can be considered as an occasional anomaly.
      However, if there are lingering alerts in the interface layer, the node should be considered a potential root cause node.
      If the anomaly alerts at the node are sporadic, the node should not be identified as the root cause.
      'output'
      The output should be a concise and clear list of nodes that meet the criteria, with full node names included (do not abbreviate or omit any details).
    - rule4
      If a node experiences an anomaly, but no interface alarm is triggered for its upstream nodes, the affected node and its entire branch can be excluded.
      'output'
      The output should be a concise and clear list of nodes that meet the criteria, with full node names included (do not abbreviate or omit any details).

  summary_node: |
    #Purpose#
    Summarize the previous node information, return a root cause node that meets the most rules and up to three suspected root cause nodes.
    #Note#
    No other additional information is required, and the node name must be complete and consistent with the source data.
    The final root cause node must not be the entry node (the top node in the topology graph).
    The node name must be complete and consistent with the topology data, and no special symbols such as spaces, *, `, etc. should be used before and after the node name.
    xxx must be followed by the word node, do not give xxx directly.
    #Output#
    The output is in JSON format, only containing the fields nodeName and otherNodeName. The node name in josn must be complete, retaining any original symbols, and cannot be omitted.
    nodeName gives the node that causes the root cause. (Do not give None, there must be a node such as the root cause is node A)
    otherNodeName gives a list of suspected root cause nodes. (There can be multiple nodes in the list, but they cannot be the same as the root cause node)
{{- end }}
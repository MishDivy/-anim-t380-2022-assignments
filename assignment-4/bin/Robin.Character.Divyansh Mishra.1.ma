FOR8          � MayaFOR83        �HEADVERS}          2022    UVER}          undef   MADE}          undef   CHNG}          Mon, Oct 17, 2022 02:24:27 PM   ICON}          undef   INFO}          undef   OBJN}          undef   INCL}          undef(  LUNI}          cm      TUNI}          film    AUNI}          deg     TDUR}          	141120000       FINF}          application maya        FINF          product Maya 2022       FINF          version 2022    FINF          &cutIdentifier 202108111415-612a77abf4   FINF   &       .osv Windows 10 Education v2009 (Build: 19043)   FINF   .       *UUID 259FA25C-41E5-0517-6DE9-31817B33CB59       PLUG           mtoa 4.2.4      FOR8           �XFRMCREA           �persp ��ɘlaG��/e��� DBLE3         v $             DBL33         t  @<      @5      @<           DBL33         r  ��5��m?�!�TD-��Cq٫r�     FOR8          ,DCAMCREA           "perspShape persp ��\��)L�� �����      DBLE3         v               DBLE3         fl $@A�����    DBLE3         coi $@Fi3k�    STR 3         imn  persp      STR 3         den  persp_depth        STR 3         man  persp_mask STR 3         hc  viewSet -p %camera  FOR8           �XFRMCREA           �top ����
D�6�"�j7   DBLE3         v $             DBL33         t          @�@�����             DBL33         r  ��!�TD-                     FOR8          �DCAMCREA           topShape top ��N�D����0�U�  DBLE3         v               DBLE3         rnd             DBLE3         coi $@�@�����   DBLE3         ow  @>          STR 3         	imn  top        STR 3         den  top_depth  STR 3         man  top_mask   STR 3         hc  viewSet -t %camera  DBLE3         o  ?�           STR 3         ai_translator  orthographic     FOR8           |XFRMCREA           �front �����UL�v���	� DBLE3         v $             DBL33         t                  @�@�����     FOR8          �DCAMCREA           "frontShape front <�:{��E�&h�oE�      DBLE3         v               DBLE3         rnd             DBLE3         coi $@�@�����   DBLE3         ow  @>          STR 3         imn  front      STR 3         den  front_depth        STR 3         man  front_mask STR 3         hc  viewSet -f %camera  DBLE3         o  ?�           STR 3         ai_translator  orthographic     FOR8           �XFRMCREA           �side �r��َM� �p��  DBLE3         v $             DBL33         t  @�@�����                     DBL33         r  �       ?�!�TD-             FOR8          �DCAMCREA            sideShape side �Ƭ��$LG� ��n.DBLE3         v               DBLE3         rnd             DBLE3         coi $@�@�����   DBLE3         ow  @>          STR 3         
imn  side       STR 3         den  side_depth STR 3         man  side_mask  STR 3         hc  viewSet -s %camera  DBLE3         o  ?�           STR 3         ai_translator  orthographic     FOR8           ,XFRMCREA           �pCone1 ��*���F��Գ^ݸFOR8          tDMSHCREA           $pConeShape1 pCone1 �nE %��I���$��W    FLGS3         v       DBLE3         vir  ?�         DBLE3         vif  ?�         STR 3         uvst[0].uvsn $map1      STR 3         cuvs  map1      STR 3         dcc  Ambient+Diffuse    CMPD3         !covm[0]          ?�      ?�             CMPD3         !cdvm[0]          ?�      ?�             FOR8           tRLLKCREA           �lightLinker1 ��D���E��oO��  FLGS3         	lnk (          FLGS3         
slnk (         FOR8           <SDMLCREA           $�shapeEditorManager ����q�F��N�96�    FOR8           DPSDMCREA           )�poseInterpolatorManager ]_z��XN��@i�tmy       FOR83         TDPLMCREA           �layerManager ��|j,7L�5��ʩ�_  FLGS3         	dli (          FOR8           4DSPLCREA           �defaultLayer կ��I�s�7#�1  FOR83         \RNLMCREA           $�renderLayerManager �����B�L�����0�    FLGS3         
rlmi (         FOR8           \RNDLCREA           $�defaultRenderLayer �E��7�-J������    DBLE3         g  ?�           FOR8           TPCONCREA           �polyCone1 ��/ ��H�b��Y�Y     DBLE3         cuv 0@         FOR8          �SCRPCREA           +�uiConfigurationScriptNode @8ZzwH����r     STR 3        ��b  // Maya Mel UI Configuration File.
//
//  This script is machine generated.  Edit at your own risk.
//
//

global string $gMainPane;
if (`paneLayout -exists $gMainPane`) {

	global int $gUseScenePanelConfig;
	int    $useSceneConfig = $gUseScenePanelConfig;
	int    $nodeEditorPanelVisible = stringArrayContains("nodeEditorPanel1", `getPanel -vis`);
	int    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);
	int    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;
	int    $nVisPanes = `paneLayout -q -nvp $gMainPane`;
	int    $nPanes = 0;
	string $editorName;
	string $panelName;
	string $itemFilterName;
	string $panelConfig;

	//
	//  get current state of the UI
	//
	sceneUIReplacement -update $gMainPane;

	$panelName = `sceneUIReplacement -getNextPanel "modelPanel" (localizedPanelLabel("Top View")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		modelPanel -edit -l (localizedPanelLabel("Top View")) -mbv $menusOkayInPanels  $panelName;
		$editorName = $panelName;
        modelEditor -e 
            -camera "|top|topShape" 
            -useInteractiveMode 0
            -displayLights "default" 
            -displayAppearance "smoothShaded" 
            -activeOnly 0
            -ignorePanZoom 0
            -wireframeOnShaded 0
            -headsUpDisplay 1
            -holdOuts 1
            -selectionHiliteDisplay 1
            -useDefaultMaterial 0
            -bufferMode "double" 
            -twoSidedLighting 0
            -backfaceCulling 0
            -xray 0
            -jointXray 0
            -activeComponentsXray 0
            -displayTextures 0
            -smoothWireframe 0
            -lineWidth 1
            -textureAnisotropic 0
            -textureHilight 1
            -textureSampling 2
            -textureDisplay "modulate" 
            -textureMaxSize 32768
            -fogging 0
            -fogSource "fragment" 
            -fogMode "linear" 
            -fogStart 0
            -fogEnd 100
            -fogDensity 0.1
            -fogColor 0.5 0.5 0.5 1 
            -depthOfFieldPreview 1
            -maxConstantTransparency 1
            -rendererName "vp2Renderer" 
            -objectFilterShowInHUD 1
            -isFiltered 0
            -colorResolution 256 256 
            -bumpResolution 512 512 
            -textureCompression 0
            -transparencyAlgorithm "frontAndBackCull" 
            -transpInShadows 0
            -cullingOverride "none" 
            -lowQualityLighting 0
            -maximumNumHardwareLights 1
            -occlusionCulling 0
            -shadingModel 0
            -useBaseRenderer 0
            -useReducedRenderer 0
            -smallObjectCulling 0
            -smallObjectThreshold -1 
            -interactiveDisableShadows 0
            -interactiveBackFaceCull 0
            -sortTransparent 1
            -controllers 1
            -nurbsCurves 1
            -nurbsSurfaces 1
            -polymeshes 1
            -subdivSurfaces 1
            -planes 1
            -lights 1
            -cameras 1
            -controlVertices 1
            -hulls 1
            -grid 1
            -imagePlane 1
            -joints 1
            -ikHandles 1
            -deformers 1
            -dynamics 1
            -particleInstancers 1
            -fluids 1
            -hairSystems 1
            -follicles 1
            -nCloths 1
            -nParticles 1
            -nRigids 1
            -dynamicConstraints 1
            -locators 1
            -manipulators 1
            -pluginShapes 1
            -dimensions 1
            -handles 1
            -pivots 1
            -textures 1
            -strokes 1
            -motionTrails 1
            -clipGhosts 1
            -greasePencils 1
            -shadows 0
            -captureSequenceNumber -1
            -width 1
            -height 1
            -sceneRenderFilter 0
            $editorName;
        modelEditor -e -viewSelected 0 $editorName;
        modelEditor -e 
            -pluginObjects "gpuCacheDisplayFilter" 1 
            $editorName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextPanel "modelPanel" (localizedPanelLabel("Side View")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		modelPanel -edit -l (localizedPanelLabel("Side View")) -mbv $menusOkayInPanels  $panelName;
		$editorName = $panelName;
        modelEditor -e 
            -camera "|side|sideShape" 
            -useInteractiveMode 0
            -displayLights "default" 
            -displayAppearance "smoothShaded" 
            -activeOnly 0
            -ignorePanZoom 0
            -wireframeOnShaded 0
            -headsUpDisplay 1
            -holdOuts 1
            -selectionHiliteDisplay 1
            -useDefaultMaterial 0
            -bufferMode "double" 
            -twoSidedLighting 0
            -backfaceCulling 0
            -xray 0
            -jointXray 0
            -activeComponentsXray 0
            -displayTextures 0
            -smoothWireframe 0
            -lineWidth 1
            -textureAnisotropic 0
            -textureHilight 1
            -textureSampling 2
            -textureDisplay "modulate" 
            -textureMaxSize 32768
            -fogging 0
            -fogSource "fragment" 
            -fogMode "linear" 
            -fogStart 0
            -fogEnd 100
            -fogDensity 0.1
            -fogColor 0.5 0.5 0.5 1 
            -depthOfFieldPreview 1
            -maxConstantTransparency 1
            -rendererName "vp2Renderer" 
            -objectFilterShowInHUD 1
            -isFiltered 0
            -colorResolution 256 256 
            -bumpResolution 512 512 
            -textureCompression 0
            -transparencyAlgorithm "frontAndBackCull" 
            -transpInShadows 0
            -cullingOverride "none" 
            -lowQualityLighting 0
            -maximumNumHardwareLights 1
            -occlusionCulling 0
            -shadingModel 0
            -useBaseRenderer 0
            -useReducedRenderer 0
            -smallObjectCulling 0
            -smallObjectThreshold -1 
            -interactiveDisableShadows 0
            -interactiveBackFaceCull 0
            -sortTransparent 1
            -controllers 1
            -nurbsCurves 1
            -nurbsSurfaces 1
            -polymeshes 1
            -subdivSurfaces 1
            -planes 1
            -lights 1
            -cameras 1
            -controlVertices 1
            -hulls 1
            -grid 1
            -imagePlane 1
            -joints 1
            -ikHandles 1
            -deformers 1
            -dynamics 1
            -particleInstancers 1
            -fluids 1
            -hairSystems 1
            -follicles 1
            -nCloths 1
            -nParticles 1
            -nRigids 1
            -dynamicConstraints 1
            -locators 1
            -manipulators 1
            -pluginShapes 1
            -dimensions 1
            -handles 1
            -pivots 1
            -textures 1
            -strokes 1
            -motionTrails 1
            -clipGhosts 1
            -greasePencils 1
            -shadows 0
            -captureSequenceNumber -1
            -width 1
            -height 1
            -sceneRenderFilter 0
            $editorName;
        modelEditor -e -viewSelected 0 $editorName;
        modelEditor -e 
            -pluginObjects "gpuCacheDisplayFilter" 1 
            $editorName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextPanel "modelPanel" (localizedPanelLabel("Front View")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		modelPanel -edit -l (localizedPanelLabel("Front View")) -mbv $menusOkayInPanels  $panelName;
		$editorName = $panelName;
        modelEditor -e 
            -camera "|front|frontShape" 
            -useInteractiveMode 0
            -displayLights "default" 
            -displayAppearance "smoothShaded" 
            -activeOnly 0
            -ignorePanZoom 0
            -wireframeOnShaded 0
            -headsUpDisplay 1
            -holdOuts 1
            -selectionHiliteDisplay 1
            -useDefaultMaterial 0
            -bufferMode "double" 
            -twoSidedLighting 0
            -backfaceCulling 0
            -xray 0
            -jointXray 0
            -activeComponentsXray 0
            -displayTextures 0
            -smoothWireframe 0
            -lineWidth 1
            -textureAnisotropic 0
            -textureHilight 1
            -textureSampling 2
            -textureDisplay "modulate" 
            -textureMaxSize 32768
            -fogging 0
            -fogSource "fragment" 
            -fogMode "linear" 
            -fogStart 0
            -fogEnd 100
            -fogDensity 0.1
            -fogColor 0.5 0.5 0.5 1 
            -depthOfFieldPreview 1
            -maxConstantTransparency 1
            -rendererName "vp2Renderer" 
            -objectFilterShowInHUD 1
            -isFiltered 0
            -colorResolution 256 256 
            -bumpResolution 512 512 
            -textureCompression 0
            -transparencyAlgorithm "frontAndBackCull" 
            -transpInShadows 0
            -cullingOverride "none" 
            -lowQualityLighting 0
            -maximumNumHardwareLights 1
            -occlusionCulling 0
            -shadingModel 0
            -useBaseRenderer 0
            -useReducedRenderer 0
            -smallObjectCulling 0
            -smallObjectThreshold -1 
            -interactiveDisableShadows 0
            -interactiveBackFaceCull 0
            -sortTransparent 1
            -controllers 1
            -nurbsCurves 1
            -nurbsSurfaces 1
            -polymeshes 1
            -subdivSurfaces 1
            -planes 1
            -lights 1
            -cameras 1
            -controlVertices 1
            -hulls 1
            -grid 1
            -imagePlane 1
            -joints 1
            -ikHandles 1
            -deformers 1
            -dynamics 1
            -particleInstancers 1
            -fluids 1
            -hairSystems 1
            -follicles 1
            -nCloths 1
            -nParticles 1
            -nRigids 1
            -dynamicConstraints 1
            -locators 1
            -manipulators 1
            -pluginShapes 1
            -dimensions 1
            -handles 1
            -pivots 1
            -textures 1
            -strokes 1
            -motionTrails 1
            -clipGhosts 1
            -greasePencils 1
            -shadows 0
            -captureSequenceNumber -1
            -width 1
            -height 1
            -sceneRenderFilter 0
            $editorName;
        modelEditor -e -viewSelected 0 $editorName;
        modelEditor -e 
            -pluginObjects "gpuCacheDisplayFilter" 1 
            $editorName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextPanel "modelPanel" (localizedPanelLabel("Persp View")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		modelPanel -edit -l (localizedPanelLabel("Persp View")) -mbv $menusOkayInPanels  $panelName;
		$editorName = $panelName;
        modelEditor -e 
            -camera "|persp|perspShape" 
            -useInteractiveMode 0
            -displayLights "default" 
            -displayAppearance "smoothShaded" 
            -activeOnly 0
            -ignorePanZoom 0
            -wireframeOnShaded 0
            -headsUpDisplay 1
            -holdOuts 1
            -selectionHiliteDisplay 1
            -useDefaultMaterial 0
            -bufferMode "double" 
            -twoSidedLighting 0
            -backfaceCulling 0
            -xray 0
            -jointXray 0
            -activeComponentsXray 0
            -displayTextures 0
            -smoothWireframe 0
            -lineWidth 1
            -textureAnisotropic 0
            -textureHilight 1
            -textureSampling 2
            -textureDisplay "modulate" 
            -textureMaxSize 32768
            -fogging 0
            -fogSource "fragment" 
            -fogMode "linear" 
            -fogStart 0
            -fogEnd 100
            -fogDensity 0.1
            -fogColor 0.5 0.5 0.5 1 
            -depthOfFieldPreview 1
            -maxConstantTransparency 1
            -rendererName "vp2Renderer" 
            -objectFilterShowInHUD 1
            -isFiltered 0
            -colorResolution 256 256 
            -bumpResolution 512 512 
            -textureCompression 0
            -transparencyAlgorithm "frontAndBackCull" 
            -transpInShadows 0
            -cullingOverride "none" 
            -lowQualityLighting 0
            -maximumNumHardwareLights 1
            -occlusionCulling 0
            -shadingModel 0
            -useBaseRenderer 0
            -useReducedRenderer 0
            -smallObjectCulling 0
            -smallObjectThreshold -1 
            -interactiveDisableShadows 0
            -interactiveBackFaceCull 0
            -sortTransparent 1
            -controllers 1
            -nurbsCurves 1
            -nurbsSurfaces 1
            -polymeshes 1
            -subdivSurfaces 1
            -planes 1
            -lights 1
            -cameras 1
            -controlVertices 1
            -hulls 1
            -grid 1
            -imagePlane 1
            -joints 1
            -ikHandles 1
            -deformers 1
            -dynamics 1
            -particleInstancers 1
            -fluids 1
            -hairSystems 1
            -follicles 1
            -nCloths 1
            -nParticles 1
            -nRigids 1
            -dynamicConstraints 1
            -locators 1
            -manipulators 1
            -pluginShapes 1
            -dimensions 1
            -handles 1
            -pivots 1
            -textures 1
            -strokes 1
            -motionTrails 1
            -clipGhosts 1
            -greasePencils 1
            -shadows 0
            -captureSequenceNumber -1
            -width 2300
            -height 1350
            -sceneRenderFilter 0
            $editorName;
        modelEditor -e -viewSelected 0 $editorName;
        modelEditor -e 
            -pluginObjects "gpuCacheDisplayFilter" 1 
            $editorName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextPanel "outlinerPanel" (localizedPanelLabel("ToggledOutliner")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		outlinerPanel -edit -l (localizedPanelLabel("ToggledOutliner")) -mbv $menusOkayInPanels  $panelName;
		$editorName = $panelName;
        outlinerEditor -e 
            -docTag "isolOutln_fromSeln" 
            -showShapes 0
            -showAssignedMaterials 0
            -showTimeEditor 1
            -showReferenceNodes 1
            -showReferenceMembers 1
            -showAttributes 0
            -showConnected 0
            -showAnimCurvesOnly 0
            -showMuteInfo 0
            -organizeByLayer 1
            -organizeByClip 1
            -showAnimLayerWeight 1
            -autoExpandLayers 1
            -autoExpand 0
            -showDagOnly 1
            -showAssets 1
            -showContainedOnly 1
            -showPublishedAsConnected 0
            -showParentContainers 0
            -showContainerContents 1
            -ignoreDagHierarchy 0
            -expandConnections 0
            -showUpstreamCurves 1
            -showUnitlessCurves 1
            -showCompounds 1
            -showLeafs 1
            -showNumericAttrsOnly 0
            -highlightActive 1
            -autoSelectNewObjects 0
            -doNotSelectNewObjects 0
            -dropIsParent 1
            -transmitFilters 0
            -setFilter "defaultSetFilter" 
            -showSetMembers 1
            -allowMultiSelection 1
            -alwaysToggleSelect 0
            -directSelect 0
            -isSet 0
            -isSetMember 0
            -displayMode "DAG" 
            -expandObjects 0
            -setsIgnoreFilters 1
            -containersIgnoreFilters 0
            -editAttrName 0
            -showAttrValues 0
            -highlightSecondary 0
            -showUVAttrsOnly 0
            -showTextureNodesOnly 0
            -attrAlphaOrder "default" 
            -animLayerFilterOptions "allAffecting" 
            -sortOrder "none" 
            -longNames 0
            -niceNames 1
            -selectCommand "print(\"\")" 
            -showNamespace 1
            -showPinIcons 0
            -mapMotionTrails 0
            -ignoreHiddenAttribute 0
            -ignoreOutlinerColor 0
            -renderFilterVisible 0
            -renderFilterIndex 0
            -selectionOrder "chronological" 
            -expandAttribute 0
            $editorName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextPanel "outlinerPanel" (localizedPanelLabel("Outliner")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		outlinerPanel -edit -l (localizedPanelLabel("Outliner")) -mbv $menusOkayInPanels  $panelName;
		$editorName = $panelName;
        outlinerEditor -e 
            -showShapes 0
            -showAssignedMaterials 0
            -showTimeEditor 1
            -showReferenceNodes 0
            -showReferenceMembers 0
            -showAttributes 0
            -showConnected 0
            -showAnimCurvesOnly 0
            -showMuteInfo 0
            -organizeByLayer 1
            -organizeByClip 1
            -showAnimLayerWeight 1
            -autoExpandLayers 1
            -autoExpand 0
            -showDagOnly 1
            -showAssets 1
            -showContainedOnly 1
            -showPublishedAsConnected 0
            -showParentContainers 0
            -showContainerContents 1
            -ignoreDagHierarchy 0
            -expandConnections 0
            -showUpstreamCurves 1
            -showUnitlessCurves 1
            -showCompounds 1
            -showLeafs 1
            -showNumericAttrsOnly 0
            -highlightActive 1
            -autoSelectNewObjects 0
            -doNotSelectNewObjects 0
            -dropIsParent 1
            -transmitFilters 0
            -setFilter "defaultSetFilter" 
            -showSetMembers 1
            -allowMultiSelection 1
            -alwaysToggleSelect 0
            -directSelect 0
            -displayMode "DAG" 
            -expandObjects 0
            -setsIgnoreFilters 1
            -containersIgnoreFilters 0
            -editAttrName 0
            -showAttrValues 0
            -highlightSecondary 0
            -showUVAttrsOnly 0
            -showTextureNodesOnly 0
            -attrAlphaOrder "default" 
            -animLayerFilterOptions "allAffecting" 
            -sortOrder "none" 
            -longNames 0
            -niceNames 1
            -showNamespace 1
            -showPinIcons 0
            -mapMotionTrails 0
            -ignoreHiddenAttribute 0
            -ignoreOutlinerColor 0
            -renderFilterVisible 0
            $editorName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "graphEditor" (localizedPanelLabel("Graph Editor")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Graph Editor")) -mbv $menusOkayInPanels  $panelName;

			$editorName = ($panelName+"OutlineEd");
            outlinerEditor -e 
                -showShapes 1
                -showAssignedMaterials 0
                -showTimeEditor 1
                -showReferenceNodes 0
                -showReferenceMembers 0
                -showAttributes 1
                -showConnected 1
                -showAnimCurvesOnly 1
                -showMuteInfo 0
                -organizeByLayer 1
                -organizeByClip 1
                -showAnimLayerWeight 1
                -autoExpandLayers 1
                -autoExpand 1
                -showDagOnly 0
                -showAssets 1
                -showContainedOnly 0
                -showPublishedAsConnected 0
                -showParentContainers 0
                -showContainerContents 0
                -ignoreDagHierarchy 0
                -expandConnections 1
                -showUpstreamCurves 1
                -showUnitlessCurves 1
                -showCompounds 0
                -showLeafs 1
                -showNumericAttrsOnly 1
                -highlightActive 0
                -autoSelectNewObjects 1
                -doNotSelectNewObjects 0
                -dropIsParent 1
                -transmitFilters 1
                -setFilter "0" 
                -showSetMembers 0
                -allowMultiSelection 1
                -alwaysToggleSelect 0
                -directSelect 0
                -displayMode "DAG" 
                -expandObjects 0
                -setsIgnoreFilters 1
                -containersIgnoreFilters 0
                -editAttrName 0
                -showAttrValues 0
                -highlightSecondary 0
                -showUVAttrsOnly 0
                -showTextureNodesOnly 0
                -attrAlphaOrder "default" 
                -animLayerFilterOptions "allAffecting" 
                -sortOrder "none" 
                -longNames 0
                -niceNames 1
                -showNamespace 1
                -showPinIcons 1
                -mapMotionTrails 1
                -ignoreHiddenAttribute 0
                -ignoreOutlinerColor 0
                -renderFilterVisible 0
                $editorName;

			$editorName = ($panelName+"GraphEd");
            animCurveEditor -e 
                -displayValues 0
                -snapTime "integer" 
                -snapValue "none" 
                -showPlayRangeShades "on" 
                -lockPlayRangeShades "off" 
                -smoothness "fine" 
                -resultSamples 1
                -resultScreenSamples 0
                -resultUpdate "delayed" 
                -showUpstreamCurves 1
                -keyMinScale 1
                -stackedCurvesMin -1
                -stackedCurvesMax 1
                -stackedCurvesSpace 0.2
                -preSelectionHighlight 0
                -constrainDrag 0
                -valueLinesToggle 1
                -highlightAffectedCurves 0
                $editorName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "dopeSheetPanel" (localizedPanelLabel("Dope Sheet")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Dope Sheet")) -mbv $menusOkayInPanels  $panelName;

			$editorName = ($panelName+"OutlineEd");
            outlinerEditor -e 
                -showShapes 1
                -showAssignedMaterials 0
                -showTimeEditor 1
                -showReferenceNodes 0
                -showReferenceMembers 0
                -showAttributes 1
                -showConnected 1
                -showAnimCurvesOnly 1
                -showMuteInfo 0
                -organizeByLayer 1
                -organizeByClip 1
                -showAnimLayerWeight 1
                -autoExpandLayers 1
                -autoExpand 0
                -showDagOnly 0
                -showAssets 1
                -showContainedOnly 0
                -showPublishedAsConnected 0
                -showParentContainers 0
                -showContainerContents 0
                -ignoreDagHierarchy 0
                -expandConnections 1
                -showUpstreamCurves 1
                -showUnitlessCurves 0
                -showCompounds 1
                -showLeafs 1
                -showNumericAttrsOnly 1
                -highlightActive 0
                -autoSelectNewObjects 0
                -doNotSelectNewObjects 1
                -dropIsParent 1
                -transmitFilters 0
                -setFilter "0" 
                -showSetMembers 0
                -allowMultiSelection 1
                -alwaysToggleSelect 0
                -directSelect 0
                -displayMode "DAG" 
                -expandObjects 0
                -setsIgnoreFilters 1
                -containersIgnoreFilters 0
                -editAttrName 0
                -showAttrValues 0
                -highlightSecondary 0
                -showUVAttrsOnly 0
                -showTextureNodesOnly 0
                -attrAlphaOrder "default" 
                -animLayerFilterOptions "allAffecting" 
                -sortOrder "none" 
                -longNames 0
                -niceNames 1
                -showNamespace 1
                -showPinIcons 0
                -mapMotionTrails 1
                -ignoreHiddenAttribute 0
                -ignoreOutlinerColor 0
                -renderFilterVisible 0
                $editorName;

			$editorName = ($panelName+"DopeSheetEd");
            dopeSheetEditor -e 
                -displayValues 0
                -snapTime "integer" 
                -snapValue "none" 
                -outliner "dopeSheetPanel1OutlineEd" 
                -showSummary 1
                -showScene 0
                -hierarchyBelow 0
                -showTicks 1
                -selectionWindow 0 0 0 0 
                $editorName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "timeEditorPanel" (localizedPanelLabel("Time Editor")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Time Editor")) -mbv $menusOkayInPanels  $panelName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "clipEditorPanel" (localizedPanelLabel("Trax Editor")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Trax Editor")) -mbv $menusOkayInPanels  $panelName;

			$editorName = clipEditorNameFromPanel($panelName);
            clipEditor -e 
                -displayValues 0
                -snapTime "none" 
                -snapValue "none" 
                -initialized 0
                -manageSequencer 0 
                $editorName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "sequenceEditorPanel" (localizedPanelLabel("Camera Sequencer")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Camera Sequencer")) -mbv $menusOkayInPanels  $panelName;

			$editorName = sequenceEditorNameFromPanel($panelName);
            clipEditor -e 
                -displayValues 0
                -snapTime "none" 
                -snapValue "none" 
                -initialized 0
                -manageSequencer 1 
                $editorName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "hyperGraphPanel" (localizedPanelLabel("Hypergraph Hierarchy")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Hypergraph Hierarchy")) -mbv $menusOkayInPanels  $panelName;

			$editorName = ($panelName+"HyperGraphEd");
            hyperGraph -e 
                -graphLayoutStyle "hierarchicalLayout" 
                -orientation "horiz" 
                -mergeConnections 0
                -zoom 1
                -animateTransition 0
                -showRelationships 1
                -showShapes 0
                -showDeformers 0
                -showExpressions 0
                -showConstraints 0
                -showConnectionFromSelected 0
                -showConnectionToSelected 0
                -showConstraintLabels 0
                -showUnderworld 0
                -showInvisible 0
                -transitionFrames 1
                -opaqueContainers 0
                -freeform 0
                -imagePosition 0 0 
                -imageScale 1
                -imageEnabled 0
                -graphType "DAG" 
                -heatMapDisplay 0
                -updateSelection 1
                -updateNodeAdded 1
                -useDrawOverrideColor 0
                -limitGraphTraversal -1
                -range 0 0 
                -iconSize "smallIcons" 
                -showCachedConnections 0
                $editorName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "hyperShadePanel" (localizedPanelLabel("Hypershade")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Hypershade")) -mbv $menusOkayInPanels  $panelName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "visorPanel" (localizedPanelLabel("Visor")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Visor")) -mbv $menusOkayInPanels  $panelName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "nodeEditorPanel" (localizedPanelLabel("Node Editor")) `;
	if ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {
		if ("" == $panelName) {
			if ($useSceneConfig) {
				$panelName = `scriptedPanel -unParent  -type "nodeEditorPanel" -l (localizedPanelLabel("Node Editor")) -mbv $menusOkayInPanels `;

			$editorName = ($panelName+"NodeEditorEd");
            nodeEditor -e 
                -allAttributes 0
                -allNodes 0
                -autoSizeNodes 1
                -consistentNameSize 1
                -createNodeCommand "nodeEdCreateNodeCommand" 
                -connectNodeOnCreation 0
                -connectOnDrop 0
                -copyConnectionsOnPaste 0
                -connectionStyle "bezier" 
                -defaultPinnedState 0
                -additiveGraphingMode 0
                -settingsChangedCallback "nodeEdSyncControls" 
                -traversalDepthLimit -1
                -keyPressCommand "nodeEdKeyPressCommand" 
                -nodeTitleMode "name" 
                -gridSnap 0
                -gridVisibility 1
                -crosshairOnEdgeDragging 0
                -popupMenuScript "nodeEdBuildPanelMenus" 
                -showNamespace 1
                -showShapes 1
                -showSGShapes 0
                -showTransforms 1
                -useAssets 1
                -syncedSelection 1
                -extendToShapes 1
                -editorMode "default" 
                -hasWatchpoint 0
                $editorName;
			}
		} else {
			$label = `panel -q -label $panelName`;
			scriptedPanel -edit -l (localizedPanelLabel("Node Editor")) -mbv $menusOkayInPanels  $panelName;

			$editorName = ($panelName+"NodeEditorEd");
            nodeEditor -e 
                -allAttributes 0
                -allNodes 0
                -autoSizeNodes 1
                -consistentNameSize 1
                -createNodeCommand "nodeEdCreateNodeCommand" 
                -connectNodeOnCreation 0
                -connectOnDrop 0
                -copyConnectionsOnPaste 0
                -connectionStyle "bezier" 
                -defaultPinnedState 0
                -additiveGraphingMode 0
                -settingsChangedCallback "nodeEdSyncControls" 
                -traversalDepthLimit -1
                -keyPressCommand "nodeEdKeyPressCommand" 
                -nodeTitleMode "name" 
                -gridSnap 0
                -gridVisibility 1
                -crosshairOnEdgeDragging 0
                -popupMenuScript "nodeEdBuildPanelMenus" 
                -showNamespace 1
                -showShapes 1
                -showSGShapes 0
                -showTransforms 1
                -useAssets 1
                -syncedSelection 1
                -extendToShapes 1
                -editorMode "default" 
                -hasWatchpoint 0
                $editorName;
			if (!$useSceneConfig) {
				panel -e -l $label $panelName;
			}
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "createNodePanel" (localizedPanelLabel("Create Node")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Create Node")) -mbv $menusOkayInPanels  $panelName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "polyTexturePlacementPanel" (localizedPanelLabel("UV Editor")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("UV Editor")) -mbv $menusOkayInPanels  $panelName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "renderWindowPanel" (localizedPanelLabel("Render View")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Render View")) -mbv $menusOkayInPanels  $panelName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextPanel "shapePanel" (localizedPanelLabel("Shape Editor")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		shapePanel -edit -l (localizedPanelLabel("Shape Editor")) -mbv $menusOkayInPanels  $panelName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextPanel "posePanel" (localizedPanelLabel("Pose Editor")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		posePanel -edit -l (localizedPanelLabel("Pose Editor")) -mbv $menusOkayInPanels  $panelName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "dynRelEdPanel" (localizedPanelLabel("Dynamic Relationships")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Dynamic Relationships")) -mbv $menusOkayInPanels  $panelName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "relationshipPanel" (localizedPanelLabel("Relationship Editor")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Relationship Editor")) -mbv $menusOkayInPanels  $panelName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "referenceEditorPanel" (localizedPanelLabel("Reference Editor")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Reference Editor")) -mbv $menusOkayInPanels  $panelName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "componentEditorPanel" (localizedPanelLabel("Component Editor")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Component Editor")) -mbv $menusOkayInPanels  $panelName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "dynPaintScriptedPanelType" (localizedPanelLabel("Paint Effects")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Paint Effects")) -mbv $menusOkayInPanels  $panelName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "scriptEditorPanel" (localizedPanelLabel("Script Editor")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Script Editor")) -mbv $menusOkayInPanels  $panelName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "profilerPanel" (localizedPanelLabel("Profiler Tool")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Profiler Tool")) -mbv $menusOkayInPanels  $panelName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	$panelName = `sceneUIReplacement -getNextScriptedPanel "contentBrowserPanel" (localizedPanelLabel("Content Browser")) `;
	if ("" != $panelName) {
		$label = `panel -q -label $panelName`;
		scriptedPanel -edit -l (localizedPanelLabel("Content Browser")) -mbv $menusOkayInPanels  $panelName;
		if (!$useSceneConfig) {
			panel -e -l $label $panelName;
		}
	}


	if ($useSceneConfig) {
        string $configName = `getPanel -cwl (localizedPanelLabel("Current Layout"))`;
        if ("" != $configName) {
			panelConfiguration -edit -label (localizedPanelLabel("Current Layout")) 
				-userCreated false
				-defaultImage "vacantCell.xP:/"
				-image ""
				-sc false
				-configString "global string $gMainPane; paneLayout -e -cn \"single\" -ps 1 100 100 $gMainPane;"
				-removeAllPanels
				-ap false
					(localizedPanelLabel("Persp View")) 
					"modelPanel"
					"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n$editorName = $panelName;\nmodelEditor -e \n    -cam `findStartUpCamera persp` \n    -useInteractiveMode 0\n    -displayLights \"default\" \n    -displayAppearance \"smoothShaded\" \n    -activeOnly 0\n    -ignorePanZoom 0\n    -wireframeOnShaded 0\n    -headsUpDisplay 1\n    -holdOuts 1\n    -selectionHiliteDisplay 1\n    -useDefaultMaterial 0\n    -bufferMode \"double\" \n    -twoSidedLighting 0\n    -backfaceCulling 0\n    -xray 0\n    -jointXray 0\n    -activeComponentsXray 0\n    -displayTextures 0\n    -smoothWireframe 0\n    -lineWidth 1\n    -textureAnisotropic 0\n    -textureHilight 1\n    -textureSampling 2\n    -textureDisplay \"modulate\" \n    -textureMaxSize 32768\n    -fogging 0\n    -fogSource \"fragment\" \n    -fogMode \"linear\" \n    -fogStart 0\n    -fogEnd 100\n    -fogDensity 0.1\n    -fogColor 0.5 0.5 0.5 1 \n    -depthOfFieldPreview 1\n    -maxConstantTransparency 1\n    -rendererName \"vp2Renderer\" \n    -objectFilterShowInHUD 1\n    -isFiltered 0\n    -colorResolution 256 256 \n    -bumpResolution 512 512 \n    -textureCompression 0\n    -transparencyAlgorithm \"frontAndBackCull\" \n    -transpInShadows 0\n    -cullingOverride \"none\" \n    -lowQualityLighting 0\n    -maximumNumHardwareLights 1\n    -occlusionCulling 0\n    -shadingModel 0\n    -useBaseRenderer 0\n    -useReducedRenderer 0\n    -smallObjectCulling 0\n    -smallObjectThreshold -1 \n    -interactiveDisableShadows 0\n    -interactiveBackFaceCull 0\n    -sortTransparent 1\n    -controllers 1\n    -nurbsCurves 1\n    -nurbsSurfaces 1\n    -polymeshes 1\n    -subdivSurfaces 1\n    -planes 1\n    -lights 1\n    -cameras 1\n    -controlVertices 1\n    -hulls 1\n    -grid 1\n    -imagePlane 1\n    -joints 1\n    -ikHandles 1\n    -deformers 1\n    -dynamics 1\n    -particleInstancers 1\n    -fluids 1\n    -hairSystems 1\n    -follicles 1\n    -nCloths 1\n    -nParticles 1\n    -nRigids 1\n    -dynamicConstraints 1\n    -locators 1\n    -manipulators 1\n    -pluginShapes 1\n    -dimensions 1\n    -handles 1\n    -pivots 1\n    -textures 1\n    -strokes 1\n    -motionTrails 1\n    -clipGhosts 1\n    -greasePencils 1\n    -shadows 0\n    -captureSequenceNumber -1\n    -width 2300\n    -height 1350\n    -sceneRenderFilter 0\n    $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\nmodelEditor -e \n    -pluginObjects \"gpuCacheDisplayFilter\" 1 \n    $editorName"
					"modelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n$editorName = $panelName;\nmodelEditor -e \n    -cam `findStartUpCamera persp` \n    -useInteractiveMode 0\n    -displayLights \"default\" \n    -displayAppearance \"smoothShaded\" \n    -activeOnly 0\n    -ignorePanZoom 0\n    -wireframeOnShaded 0\n    -headsUpDisplay 1\n    -holdOuts 1\n    -selectionHiliteDisplay 1\n    -useDefaultMaterial 0\n    -bufferMode \"double\" \n    -twoSidedLighting 0\n    -backfaceCulling 0\n    -xray 0\n    -jointXray 0\n    -activeComponentsXray 0\n    -displayTextures 0\n    -smoothWireframe 0\n    -lineWidth 1\n    -textureAnisotropic 0\n    -textureHilight 1\n    -textureSampling 2\n    -textureDisplay \"modulate\" \n    -textureMaxSize 32768\n    -fogging 0\n    -fogSource \"fragment\" \n    -fogMode \"linear\" \n    -fogStart 0\n    -fogEnd 100\n    -fogDensity 0.1\n    -fogColor 0.5 0.5 0.5 1 \n    -depthOfFieldPreview 1\n    -maxConstantTransparency 1\n    -rendererName \"vp2Renderer\" \n    -objectFilterShowInHUD 1\n    -isFiltered 0\n    -colorResolution 256 256 \n    -bumpResolution 512 512 \n    -textureCompression 0\n    -transparencyAlgorithm \"frontAndBackCull\" \n    -transpInShadows 0\n    -cullingOverride \"none\" \n    -lowQualityLighting 0\n    -maximumNumHardwareLights 1\n    -occlusionCulling 0\n    -shadingModel 0\n    -useBaseRenderer 0\n    -useReducedRenderer 0\n    -smallObjectCulling 0\n    -smallObjectThreshold -1 \n    -interactiveDisableShadows 0\n    -interactiveBackFaceCull 0\n    -sortTransparent 1\n    -controllers 1\n    -nurbsCurves 1\n    -nurbsSurfaces 1\n    -polymeshes 1\n    -subdivSurfaces 1\n    -planes 1\n    -lights 1\n    -cameras 1\n    -controlVertices 1\n    -hulls 1\n    -grid 1\n    -imagePlane 1\n    -joints 1\n    -ikHandles 1\n    -deformers 1\n    -dynamics 1\n    -particleInstancers 1\n    -fluids 1\n    -hairSystems 1\n    -follicles 1\n    -nCloths 1\n    -nParticles 1\n    -nRigids 1\n    -dynamicConstraints 1\n    -locators 1\n    -manipulators 1\n    -pluginShapes 1\n    -dimensions 1\n    -handles 1\n    -pivots 1\n    -textures 1\n    -strokes 1\n    -motionTrails 1\n    -clipGhosts 1\n    -greasePencils 1\n    -shadows 0\n    -captureSequenceNumber -1\n    -width 2300\n    -height 1350\n    -sceneRenderFilter 0\n    $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\nmodelEditor -e \n    -pluginObjects \"gpuCacheDisplayFilter\" 1 \n    $editorName"
				$configName;

            setNamedPanelLayout (localizedPanelLabel("Current Layout"));
        }

        panelHistory -e -clear mainPanelHistory;
        sceneUIReplacement -clear;
	}


grid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;
viewManip -drawCompass 0 -compassAngle 0 -frontParameters "" -homeParameters "" -selectionLockParameters "";
}
     DBLE3         st  @          FOR8           �SCRPCREA           .�sceneConfigurationScriptNode a.��IYD�%��ka  STR 3         4b  playbackOptions -min 1 -max 120 -ast 1 -aet 200      DBLE3         st  @          FOR83         \SLCTSLCT           :time1  DBLE           o       Y��     DBLE           unw       Y��   FOR83        �SLCTSLCT           :hardwareRenderingGlobals       STR#}          �otfna     NURBS Curves NURBS Surfaces Polygons Subdiv Surface Particles Particle Instance Fluids Strokes Image Planes UI Lights Cameras Locators Joints IK Handles Deformers Motion Trails Components Hair Systems Follicles Misc. UI Ornaments        I32#}          _otfva                                                                                   DBLE3         fprt  ?�        FOR83         <SLCTSLCT           :renderPartitionFLGS           st    FOR83         ,SLCTSLCT           :renderGlobalsList1     FOR83         DSLCTSLCT           :defaultShaderList1     FLGS           s (    FOR83         DSLCTSLCT           :postProcessList1       FLGS           p (    FOR83         ,SLCTSLCT           :defaultRenderingList1  FOR83         LSLCTSLCT           :initialShadingGroup    DBLE}          ro  ?�          FOR83         LSLCTSLCT           :initialParticleSE      DBLE}          ro  ?�          FOR83         �SLCTSLCT           :defaultRenderGlobals   ATTR           -aTYP � @   STR defaultSurfaceShader dss        STR }          ren  arnold     STR }          dss  lambert1   FOR83         LSLCTSLCT           :defaultResolution      DBLE3         pa  ?�          FOR83        �SLCTSLCT           :defaultColorMgtGlobals DBLE3         cfe  ?�         STR }          @cfp  <MAYA_RESOURCES>/OCIO-configs/Maya2022-default/config.ocio STR }          vtn  ACES 1.0 SDR-video (sRGB)  STR }          vn  ACES 1.0 SDR-video  STR }          	dn  sRGB        STR }          wsn  ACEScg     STR }          otn  ACES 1.0 SDR-video (sRGB)  STR }           potn  ACES 1.0 SDR-video (sRGB) FOR83         lSLCTSLCT           :hardwareRenderGlobals  DBLE3         ctrs $@p        DBLE3         btrs $@�        LIS8          �CONSFOR83        �CONNCWFL            polyCone1.out pConeShape1.i    RELA           Mlink :lightLinker1    :initialShadingGroup.message :defaultLightSet.message    RELA����       Klink :lightLinker1    :initialParticleSE.message :defaultLightSet.message      RELA����       SshadowLink :lightLinker1    :initialShadingGroup.message :defaultLightSet.message      RELA����       QshadowLink :lightLinker1    :initialParticleSE.message :defaultLightSet.message        CWFL           % layerManager.dli[0] defaultLayer.id    CWFL           4 renderLayerManager.rlmi[0] defaultRenderLayer.rlid     CWFL           1defaultRenderLayer.msg :defaultRenderingList1.r        CWFL           *pConeShape1.iog :initialShadingGroup.dsm       FOR8           LHEADOBJN}          20      INCL}          undef(  BCSZ3            D    
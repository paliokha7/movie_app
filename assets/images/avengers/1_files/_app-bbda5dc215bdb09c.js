    ${u.setTypographyType("body")}
    ${u.setPropertyToColorVar("color","ipt-on-baseAlt-textPrimary-color")}
`,h=d.default.header`
    ${u.setTypographyType("headline5")}
`,_=d.default.section`
    margin-top: ${u.spacing.l};
`,m=d.default.header`
    ${u.setTypographyType("subtitle")}
    padding: ${u.spacing.m} 0;
`,v=d.default.div`
    display: flex;
    justify-content: space-around;
    align-items: flex-end;
`,g=d.default.div`
    display: flex;
    flex-direction: column;
    place-items: center;
    flex: 1;
    text-align: center;
`,E=d.default.label`
    ${u.setTypographyType("bodySmall")}
    ${u.setPropertyToColorVar("color","ipt-on-baseAlt-textSecondary-color")}
    visibility: ${e=>e.hidden?"hidden":"visible"};
`,b=d.default.div`
    display: flex;
    justify-content: flex-end;
    gap: ${u.spacing.m};
    margin-top: ${u.spacing.m};
`,S=d.default.span`
    ${u.setPropertyToColorVar("color","ipt-accent3-color")}
    margin-left: 10px;
`;t.default=({dismissModal:e,adMetadata:t})=>{const[n,r]=l.useState(null),[o,a]=l.useState(null),[i,u]=l.useState(""),[d,y]=l.useState(!1),T=null!==n,A=null!==o,C=i.length<=500,[O,I]=l.useState(!1),L=()=>{T&&A&&C?(f.sendFeedback({adMetadata:t,relevanceRating:n,appropriatenessRating:o,userComments:i}),y(!0)):I(!0)};l.useEffect((()=>{if(d){const t=setTimeout(e,1e4);return()=>{clearTimeout(t)}}}),[d]);const w=[{rating:1,label:"Not Relevant"},{rating:2,label:"_"},{rating:3,label:"Neutral"},{rating:4,label:"_"},{rating:5,label:"Relevant"}],N=[{rating:1,label:"Not Appropriate"},{rating:2,label:"_"},{rating:3,label:"Neutral"},{rating:4,label:"_"},{rating:5,label:"Appropriate"}],P=(e,t,n)=>({rating:r,label:o})=>{const a=e+r;return l.createElement(g,{key:a},l.createElement(E,{htmlFor:a,hidden:"_"===o},o),l.createElement(c.RadioButton,{ariaLabel:a,id:a,name:a,value:r.toString(),checked:r===t,onChange:e=>n(parseInt(e,10))}))};return l.createElement(p,null,d?l.createElement(l.Fragment,null,l.createElement(h,null,"Thank you"),l.createElement(_,null,"Your feedback will help us show more helpful ads on IMDb.")):l.createElement(l.Fragment,null,l.createElement(h,null,"Share your feedback"),l.createElement(_,null,l.createElement(m,null,"How relevant is this ad?",O&&!T&&l.createElement(S,null,"(required)")),l.createElement(v,null,w.map(P("relevance",n,r)))),l.createElement(_,null,l.createElement(m,null,"How appropriate is this ad for IMDb?",O&&!A&&l.createElement(S,null,"(required)")),l.createElement(v,null,N.map(P("appropriateness",o,a)))),l.createElement(_,null,l.createElement(c.TextArea,{name:"comments",label:"Additional Comments (optional)",placeholder:"Your comments will be aggregated and reviewed and not replied to directly.",baseColor:"base",value:i,errorText:C?"":`${i.length}/500 characters`,stateType:C?s.StateType.default:s.StateType.error,onChange:e=>u(e||""),rows:2})),l.createElement(b,null,l.createElement(c.TextButton,{onClick:e,onColor:"textPrimary"},"Cancel"),l.createElement(c.SecondaryButton,{onClick:L,onColor:"onBase"},"Send feedback"))))}},72114:function(e,t,n){"use strict";var r=this&&this.__createBinding||(Object.create?function(e,t,n,r){void 0===r&&(r=n),Object.defineProperty(e,r,{enumerable:!0,get:function(){return t[n]}})}:function(e,t,n,r){void 0===r&&(r=n),e[r]=t[n]}),o=this&&this.__setModuleDefault||(Object.create?function(e,t){Object.defineProperty(e,"default",{enumerable:!0,value:t})}:function(e,t){e.default=t}),a=this&&this.__importStar||function(e){if(e&&e.__esModule)return e;var t={};if(null!=e)for(var n in e)"default"!==n&&Object.prototype.hasOwnProperty.call(e,n)&&r(t,e,n);return o(t,e),t},i=this&&this.__importDefault||function(e){return e&&e.__esModule?e:{default:e}};Object.defineProperty(t,"__esModule",{value:!0});const s=n(88169),c=a(n(2784)),u=i(n(77432));t.default=()=>{const[e,t]=c.useState(null),n=e=>{const{context:n,...r}=e.data;"ad-feedback"===n&&t(r)},r=()=>t(null);c.useEffect((()=>(window.addEventListener("message",n),()=>{window.removeEventListener("message",n)})),[]);const o=null!==e;return c.createElement(s.Dialog,{isOpen:o,onCloseClicked:r},c.createElement(u.default,{dismissModal:r,adMetadata:e}))}},35313:function(e,t,n){"use strict";var r=this&&this.__createBinding||(Object.create?function(e,t,n,r){void 0===r&&(r=n),Object.defineProperty(e,r,{enumerable:!0,get:function(){return t[n]}})}:function(e,t,n,r){void 0===r&&(r=n),e[r]=t[n]}),o=this&&this.__setModuleDefault||(Object.create?function(e,t){Object.defineProperty(e,"default",{enumerable:!0,value:t})}:function(e,t){e.default=t}),a=this&&this.__importStar||function(e){if(e&&e.__esModule)return e;var t={};if(null!=e)for(var n in e)"default"!==n&&Object.prototype.hasOwnProperty.call(e,n)&&r(t,e,n);return o(t,e),t};Object.defineProperty(t,"__esModule",{value:!0});const i=a(n(2784)),s=n(5401),c=n(87324);t.default=({dateOptions:e})=>{const[t,n]=i.useState(!1),[r,o]=i.useState(""),[a,u]=i.useState((new Date).toISOString().slice(0,16)),[l,d]=i.useState((new Date).toISOString().slice(0,16));i.useEffect((()=>{e.length<=1&&(n(!0),o("Custom"))}),[e]);const f=i.default.createElement(c.StyledSimpleSelect,{label:"Select Date",value:r,id:"select-date",onChange:e=>{if("Custom"===e)n(!0);else{n(!1);const t=s.formatDateString(e);u(t)}o(e)},options:e}),p=i.default.createElement("input",{type:"date",id:"date",name:"datePicker","data-testid":"date",value:l,onChange:e=>{const t=e.target.value,n=s.formatDateString(t);d(t),u(n)},style:{width:"100%"}});return i.default.createElement(i.default.Fragment,null,i.default.createElement(c.FullWidthRow,null,i.default.createElement(c.DateDropdown,null,f),i.default.createElement(c.SetClearButton,{onClick:()=>{const e=new URL(window.location.href);e.searchParams.set("simulatedDate",a),window.history.replaceState({},document.title,e.toString()),window.location.reload()}},"Set"),i.default.createElement(c.SetClearButton,{onClick:()=>{const e=new URL(window.location.href);e.searchParams.delete("simulatedDate"),window.history.replaceState({},document.title,e.toString()),window.location.reload()}},"Clear")),t&&i.default.createElement(c.FullWidthRow,null,p))}},27716:function(e,t,n){"use strict";var r=this&&this.__createBinding||(Object.create?function(e,t,n,r){void 0===r&&(r=n),Object.defineProperty(e,r,{enumerable:!0,get:function(){return t[n]}})}:function(e,t,n,r){void 0===r&&(r=n),e[r]=t[n]}),o=this&&this.__setModuleDefault||(Object.create?function(e,t){Object.defineProperty(e,"default",{enumerable:!0,value:t})}:function(e,t){e.default=t}),a=this&&this.__importStar||function(e){if(e&&e.__esModule)return e;var t={};if(null!=e)for(var n in e)"default"!==n&&Object.prototype.hasOwnProperty.call(e,n)&&r(t,e,n);return o(t,e),t},i=this&&this.__importDefault||function(e){return e&&e.__esModule?e:{default:e}};Object.defineProperty(t,"__esModule",{value:!0});const s=n(88169),c=a(n(2784)),u=n(97524),l=n(5401),d=n(8070),f=i(n(35313)),p=a(n(87324)),h=new Map([["NONE",0],["SMALL",320],["MEDIUM",768],["LARGE",1024],["X-LARGE",1280]]);function _(e){return Array.from(h.keys()).sort(((e,t)=>(h.get(t)||0)-(h.get(e)||0))).filter((t=>e>=(h.get(t)||0)))[0]}class m extends c.Component{constructor(){super(...arguments),this.state={currentPreviewSize:"SMALL",hasFreedoniaCookie:!1,freedoniaCookieValue:"",showPreview:!0,windowWidth:0,showDateOption:!1,extractedDateList:[]},this.handleWindowSizeChange=()=>{d.isDefined(window)&&this.setState({windowWidth:window.innerWidth,currentPreviewSize:_(window.innerWidth)})},this.setDateOptions=()=>{const e=Array.from(frames),t=window.AdSlots?Object.keys(window.AdSlots):[],n=l.extractDateRanges(e,t);this.setState({extractedDateList:n})},this.clear=()=>{u.removeFreedoniaCookie()},this.reset=()=>{d.isDefined(window)&&window.ad_utils&&(window.ad_utils.fp.clear_autoplay(),alert("Auto-play reset"))},this.togglePreview=()=>{this.setState((e=>({showPreview:!e.showPreview})))},this.getWrapperStyle=()=>{const e=(this.state.windowWidth-p.CONTAINER_WIDTH)/2+"px";return{...p.default.Wrapper,left:e}},this.handleCalendarIconClick=()=>{this.setState((e=>({showDateOption:!e.showDateOption})))}}componentDidMount(){const e=u.getFreedoniaCookie(),t=!!e;if(t&&(setTimeout((()=>{window.AdSlots&&this.setDateOptions()}),1e3),d.isDefined(window))){const n=window.innerWidth;this.setState({...this.state,freedoniaCookieValue:e,hasFreedoniaCookie:t,windowWidth:n,currentPreviewSize:_(n)}),t&&window.addEventListener("resize",this.handleWindowSizeChange)}}componentWillUnmount(){d.isDefined(window)&&window.removeEventListener("resize",this.handleWindowSizeChange)}createDateOptions(e){const t="Custom",n=e.map((e=>({value:e,text:e})));return n.push({value:t,text:t}),n}render(){const{currentPreviewSize:e,freedoniaCookieValue:t,hasFreedoniaCookie:n,showPreview:r,showDateOption:o,extractedDateList:a}=this.state;if(!n)return null;const{isInFreedoniaDateCheckWeblab:i}=this.props,u=this.createDateOptions(a),l=r?c.default.createElement(c.default.Fragment,null,c.default.createElement(p.SIconButton,{name:"arrow",label:"Collapse",onClick:this.togglePreview}),c.default.createElement(p.FullWidthRow,null,c.default.createElement(p.SButton,{preIcon:"play-circle-filled",onClick:this.reset},"Reset auto-play"),c.default.createElement(p.SButton,{preIcon:"clear",onClick:this.clear},"Clear ad preview"),i&&c.default.createElement(p.CalendarIconButton,{onClick:this.handleCalendarIconClick,isActive:this.state.showDateOption},c.default.createElement(s.Icon,{name:"today"}))),o&&i&&c.default.createElement(f.default,{dateOptions:u}),c.default.createElement("div",{style:p.default.SettingsTitle},"Settings"),c.default.createElement("textarea",{style:p.default.Settings,value:t,readOnly:!0}),c.default.createElement("div",null,"Current ad break point: ",e)):c.default.createElement(p.SIconButton,{name:"expand-less",label:"Show",onClick:this.togglePreview});return c.default.createElement("div",{"data-testid":"freedonia-preview-container",style:this.getWrapperStyle()},c.default.createElement("h3",{style:p.default.Title},"IMDb Freedonia Ad Preview Tool"),l)}}t.default=m},87324:function(e,t,n){"use strict";var r=this&&this.__importDefault||function(e){return e&&e.__esModule?e:{default:e}};Object.defineProperty(t,"__esModule",{value:!0}),t.FullWidthRow=t.StyledSimpleSelect=t.DateDropdown=t.SetClearButton=t.CalendarIconButton=t.SButton=t.SIconButton=t.DatePickerWrapper=t.SettingsTitle=t.Title=t.Settings=t.Buttons=t.Wrapper=t.CONTAINER_WIDTH=void 0;const o=n(61986),a=n(88169),i=r(n(19596));t.CONTAINER_WIDTH=340,t.Wrapper={background:"var(--ipt-base-shade2-bg)",border:"1px solid #aaa",borderRadius:"3px",bottom:"0",color:"var(--ipt-on-base-color)",fontFamily:"Roboto,Helvetica,Arial,sans-serif",fontSize:"11pt",left:"50%",padding:"5px",position:"fixed",width:`${t.CONTAINER_WIDTH}`,zIndex:100},t.Buttons={display:"flex",justifyContent:"space-between",marginTop:"2px",marginBottom:"2px"},t.Settings={maxWidth:"100%",maxHeight:"300px",minHeight:"50px",width:"100%"},t.Title={display:"inline-block",marginTop:"6px",marginBottom:"4px"},t.SettingsTitle={fontSize:"9pt",marginTop:"3px",marginBottom:"3px"},t.DatePickerWrapper={marginTop:"8px",display:"flex",alignItems:"center"},t.SIconButton=i.default(a.IconButton)`
    float: right;
    padding: 1px !important;
`,t.SButton=i.default(a.SecondaryButton)`
    font-size: 12px !important;
    min-width: 125px;
    margin-right: 1px;
    margin-left: 1px;
    padding: 0 0rem;
`,t.CalendarIconButton=i.default(a.SecondaryButton)`
    font-size: 12px !important;
    margin-right: 1px;
    margin-left: 1px;
    padding: 0 0rem;

    border: ${e=>e.isActive?"1px solid #007bff":"none"};
`,t.SetClearButton=i.default(a.SecondaryButton)`
    font-size: 14px !important;
    margin-right: 1px;
    margin-left: 1px;
    padding: 0 0rem;
    cursor: pointer;
    white-space: nowrap;
    border-radius: 4px;
`,t.DateDropdown=i.default.div`
    width: 100%;
`,t.StyledSimpleSelect=i.default(o.SimpleSelect)`
    width: 100%;

    .ipc-simple-select__label,
    .ipc-simple-select__selected-option {
        width: 100%;
    }
`,t.FullWidthRow=i.default.div`
    display: flex;
    align-items: flex-start;
    flex-shrink: 0;
    justify-content: space-between;
    margin: 5px;
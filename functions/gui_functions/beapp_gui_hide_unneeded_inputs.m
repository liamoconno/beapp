% turn corresponding inputs invisible in GUI if checkbox is selected/field
% is set to a specific value
% checkbox_tag is the tag for the primary field
% other_input_tags are corresponding tags to mark visible or invisible
% checkbox_on_val ('On' or 'Off')-- turn inputs visible or invisible if
% checkbox/field is expected value
% comp_val is comparison value for field

function beapp_gui_hide_unneeded_inputs(checkbox_tag, other_input_tags,checkbox_on_val,comp_val)

% confirm checkbox is on or off
if isequal(comp_val,'NoCompVal')
    checkbox_sel = get(findobj('tag',checkbox_tag),'Value');
else % or check if desired element is set to a specific value
    checkbox_sel = isequal(get(findobj('tag',checkbox_tag),'Value'),comp_val);
end

% set visibility dependent on element value 
if (checkbox_sel && strcmp(checkbox_on_val,'On')) ||  (~checkbox_sel && strcmp(checkbox_on_val,'Off'))
    set_vis_str = 'On';
elseif (~checkbox_sel && strcmp(checkbox_on_val,'On')) ||  (checkbox_sel && strcmp(checkbox_on_val,'Off'))
    set_vis_str = 'Off';
end

for curr_input_tag = 1:length(other_input_tags) 
    set(findobj('tag',other_input_tags{curr_input_tag}), 'Visible', set_vis_str);
end

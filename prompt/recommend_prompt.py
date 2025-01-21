
MoRE_base_v1_prompt = \
    "The user has interacted in chronological order with items: {inters}. " \
    "Here is the candidate set for the next recommendation (candidate set size is [[candidate_set_size]]): {candidate_set}. " \
    "Please recommend from the candidate set. List the top 10 recommendations in numbered bullet points. Note that your reommendation should be RANKED. " \
    "Don't output any other content."

MoRE_base_prompt = \
    "The user has interacted in chronological order with items: {inters}. " \
    "Here is the candidate set for the next recommendation (candidate set size is [[candidate_set_size]]): {candidate_set}. " \
    "Please recommend from the candidate set. List the top 10 recommendations in numbered bullet points. " \
    "Don't output any other content."

MoRE_wo_reflect_prompt = "[[example]]I've purchased the following products in the past in order:\n{inters}\n\n" \
    "Now there are [[candidate_set_size]] candidate products that I can consider to purchase next:\n{candidate_set}\n" \
    "Please rank these [[candidate_set_size]] products by measuring the possibilities that I would like to purchase next most, according to the given purchasing records. Please think step by step.\n" \
    "Please show me your ranking results with order numbers. Split your output with line break. You MUST rank the given candidates. You can not generate candidates that are not in the given candidate list."


MoRE_w_reflect = \
    "I've purchased the following products in the past in order:\n{inters}\n\n" \
    "Now there are [[candidate_set_size]] candidate products that I can consider to purchase next:\n{candidate_set}\n" \
    "And after last previous recommendation (maybe a failed trial), you gives the following reflects:\n{reflect}\n" \
    "Please rank these [[candidate_set_size]] products by measuring the possibilities that I would like to purchase next most, according to the given purchasing records and reflects. Please think step by step.\n" \
    "Please show me your ranking results with order numbers. Split your output with line break. You MUST rank the given candidates. You can not generate candidates that are not in the given candidate list."

MoRE_w_reflect_v1 = \
    "I've purchased the following products in the past in order:\n{inters}\n\n" \
    "Now there are [[candidate_set_size]] candidate products that I can consider to purchase next:\n{candidate_set}\n" \
    "And after last previous recommendation (maybe a failed trial), you give the following reflects:\n{reflect}\n" \
    "Please rank these [[candidate_set_size]] products by measuring the possibilities that I would like to purchase next most, according to the given purchasing records and reflects. Please think step by step.\n" \
    "Please show me your ranking results with order numbers. Split your output with line break. You MUST rank the given candidates. You can not generate candidates that are not in the given candidate list."

MoRE_w_reflect_v2 = \
    "I've purchased the following products in the past in order:\n{inters}\n\n" \
    "Now there are [[candidate_set_size]] candidate products that I can consider to purchase next:\n{candidate_set}\n" \
    "And after last previous recommendation for me (maybe a failed trial), you receive the following reflects:\n{reflect}\n" \
    "Please rank these [[candidate_set_size]] products by measuring the possibilities that I would like to purchase next most, according to the given purchasing records and reflects. Please think step by step.\n" \
    "Please show me your ranking results with order numbers. Split your output with line break. You MUST rank the given candidates. You can not generate candidates that are not in the given candidate list."

MoRE_w_reflect_v3 = \
    "I've purchased the following products in the past in order:\n{inters}\n\n" \
    "And after last previous recommendation (maybe a failed trial), you give the following reflects:\n{reflect}\n" \
    "Now there are [[candidate_set_size]] candidate products that I can consider to purchase next:\n{candidate_set}\n" \
    "Please rank these [[candidate_set_size]] products by measuring the possibilities that I would like to purchase next most, according to the given purchasing records and reflects. Please think step by step.\n" \
    "Please show me your ranking results with order numbers. Split your output with line break. You MUST rank the given candidates. You can not generate candidates that are not in the given candidate list."

MoRE_w_reflect_v4 = \
    "I've purchased the following products in the past in order:\n{inters}\n\n" \
    "And after last previous recommendation (maybe a failed trial), you receive the following reflects:\n{reflect}\n" \
    "Now there are [[candidate_set_size]] candidate products that I can consider to purchase next:\n{candidate_set}\n" \
    "Please rank these [[candidate_set_size]] products by measuring the possibilities that I would like to purchase next most, according to the given purchasing records and reflects. Please think step by step.\n" \
    "Please show me your ranking results with order numbers. Split your output with line break. You MUST rank the given candidates. You can not generate candidates that are not in the given candidate list."


rec_prompts = {
    "MoRE_wo_reflect": MoRE_wo_reflect_prompt,
    "MoRE_base": MoRE_base_prompt,
    "MoRE_base_v1": MoRE_base_v1_prompt,
    "MoRE_w_reflect_v0": MoRE_w_reflect,
    "MoRE_w_reflect_v1": MoRE_w_reflect_v1,
    "MoRE_w_reflect_v2": MoRE_w_reflect_v2,
    "MoRE_w_reflect_v3": MoRE_w_reflect_v3,
    "MoRE_w_reflect_v4": MoRE_w_reflect_v4,
}


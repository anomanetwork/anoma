defmodule Nock.Jets.Mugs do
  @moduledoc """
  I am the Mugs module for the Nock Jet system.

  I have all the information for the mugs of any jetted arm in the Anoma
  standard library.
  """

  alias Nock.Jets

  @layer_1_context_mug Jets.calculate_mug_of_layer(1)
  @layer_4_context_mug Jets.calculate_mug_of_layer(4)
  @layer_5_context_mug Jets.calculate_mug_of_layer(5)
  @layer_6_context_mug Jets.calculate_mug_of_layer(6)
  @layer_7_context_mug Jets.calculate_mug_of_layer(7)
  @layer_8_context_mug Jets.calculate_mug_of_layer(8)
  @layer_9_context_mug Jets.calculate_mug_of_layer(9)
  @layer_10_context_mug Jets.calculate_mug_of_layer(10)
  @layer_4_block_context_mug Jets.calculate_mug_of_param_layer(10, 4)
  @layer_10_in_context_mug Jets.calculate_mug_of_param_layer(21, 10)
  @layer_11_in_context_mug Jets.calculate_mug_of_param_layer(21, 11)

  # always the topmost layer
  @layer_rm_context_mug Jets.calculate_mug_of_layer(Nock.Lib.stdlib_layers())

  # hardcoded jet registry
  # valid statuses:
  # - :enabled, jet is fully enabled
  # - :disabled, jet is fully disabled
  # - :check, check that jet and naive produce the same result
  @jet_registry %{
    Jets.calculate_mug_of_core(342, 1) =>
      {"dec", 7, @layer_1_context_mug, &Nock.Jets.dec/1, :enabled, 10},
    Jets.calculate_mug_of_core(20, 1) =>
      {"add", 7, @layer_1_context_mug, &Nock.Jets.add/1, :enabled, 10},
    Jets.calculate_mug_of_core(47, 1) =>
      {"sub", 7, @layer_1_context_mug, &Nock.Jets.sub/1, :enabled, 10},
    Jets.calculate_mug_of_core(343, 1) =>
      {"lth", 7, @layer_1_context_mug, &Nock.Jets.lth/1, :enabled, 10},
    Jets.calculate_mug_of_core(84, 1) =>
      {"lte", 7, @layer_1_context_mug, &Nock.Jets.lte/1, :enabled, 10},
    Jets.calculate_mug_of_core(43, 1) =>
      {"gth", 7, @layer_1_context_mug, &Nock.Jets.gth/1, :enabled, 10},
    Jets.calculate_mug_of_core(22, 1) =>
      {"gte", 7, @layer_1_context_mug, &Nock.Jets.gte/1, :enabled, 10},
    Jets.calculate_mug_of_core(4, 1) =>
      {"mul", 7, @layer_1_context_mug, &Nock.Jets.mul/1, :enabled, 10},
    Jets.calculate_mug_of_core(170, 1) =>
      {"div", 7, @layer_1_context_mug, &Nock.Jets.div/1, :enabled, 10},
    Jets.calculate_mug_of_core(46, 1) =>
      {"mod", 7, @layer_1_context_mug, &Nock.Jets.mod/1, :enabled, 10},
    Jets.calculate_mug_of_core(4, 6) =>
      {"verify", 7, @layer_6_context_mug, &Nock.Jets.verify/1, :enabled, 100},
    Jets.calculate_mug_of_core(10, 6) =>
      {"sign", 7, @layer_6_context_mug, &Nock.Jets.sign/1, :enabled, 100},
    Jets.calculate_mug_of_core(22, 6) =>
      {"verify-detatched", 7, @layer_6_context_mug,
       &Nock.Jets.verify_detatched/1, :enabled, 100},
    Jets.calculate_mug_of_core(23, 6) =>
      {"sign-detatched", 7, @layer_6_context_mug, &Nock.Jets.sign_detatched/1,
       :enabled, 100},
    Jets.calculate_mug_of_core(4, 4) =>
      {"bex", 7, @layer_4_context_mug, &Nock.Jets.bex/1, :enabled, 20},
    Jets.calculate_mug_of_core(4, 5) =>
      {"mix", 7, @layer_5_context_mug, &Nock.Jets.mix/1, :enabled, 20},
    Jets.calculate_mug_of_core(22, 5) =>
      {"jam", 7, @layer_5_context_mug, &Nock.Jets.jam/1, :enabled, 50},
    Jets.calculate_mug_of_core(94, 5) =>
      {"cue", 7, @layer_5_context_mug, &Nock.Jets.cue/1, :enabled, 50},
    Jets.calculate_mug_of_core(22, 7) =>
      {"shax", 7, @layer_7_context_mug, &Nock.Jets.shax/1, :enabled, 100},
    Jets.calculate_mug_of_param_core(190, 10, 4) =>
      {"met", 14, @layer_4_block_context_mug, &Nock.Jets.met/1, :enabled, 20},
    Jets.calculate_mug_of_param_core(367, 10, 4) =>
      {"end", 14, @layer_4_block_context_mug, &Nock.Jets.nend/1, :enabled, 20},
    Jets.calculate_mug_of_param_core(90, 10, 4) =>
      {"lsh", 14, @layer_4_block_context_mug, &Nock.Jets.lsh/1, :enabled, 20},
    Jets.calculate_mug_of_param_core(767, 10, 4) =>
      {"rsh", 14, @layer_4_block_context_mug, &Nock.Jets.rsh/1, :enabled, 20},
    Jets.calculate_mug_of_core(1515, 8) =>
      {"abs", 7, @layer_8_context_mug, &Nock.Jets.abs/1, :enabled, 30},
    Jets.calculate_mug_of_core(759, 8) =>
      {"dif", 7, @layer_8_context_mug, &Nock.Jets.dif/1, :enabled, 30},
    Jets.calculate_mug_of_core(22, 8) =>
      {"dul", 7, @layer_8_context_mug, &Nock.Jets.dul/1, :enabled, 30},
    Jets.calculate_mug_of_core(190, 8) =>
      {"fra", 7, @layer_8_context_mug, &Nock.Jets.fra/1, :enabled, 30},
    Jets.calculate_mug_of_core(46, 8) =>
      {"pro", 7, @layer_8_context_mug, &Nock.Jets.pro/1, :enabled, 30},
    Jets.calculate_mug_of_core(1514, 8) =>
      {"rem", 7, @layer_8_context_mug, &Nock.Jets.rem/1, :enabled, 30},
    Jets.calculate_mug_of_core(4, 8) =>
      {"sum", 7, @layer_8_context_mug, &Nock.Jets.sum/1, :enabled, 30},
    Jets.calculate_mug_of_core(10, 8) =>
      {"sun", 7, @layer_8_context_mug, &Nock.Jets.sun/1, :enabled, 30},
    Jets.calculate_mug_of_core(188, 8) =>
      {"syn", 7, @layer_8_context_mug, &Nock.Jets.syn/1, :enabled, 30},
    Jets.calculate_mug_of_core(191, 8) =>
      {"cmp", 7, @layer_8_context_mug, &Nock.Jets.cmp/1, :enabled, 30},
    Jets.calculate_mug_of_core(189, 9) =>
      {"mug", 7, @layer_9_context_mug, &Nock.Jets.nmug/1, :enabled, 50},
    Jets.calculate_mug_of_core(765, 9) =>
      {"dor", 7, @layer_9_context_mug, &Nock.Jets.dor/1, :enabled, 30},
    Jets.calculate_mug_of_core(190, 9) =>
      {"gor", 7, @layer_9_context_mug, &Nock.Jets.gor/1, :enabled, 30},
    Jets.calculate_mug_of_core(10, 9) =>
      {"mor", 7, @layer_9_context_mug, &Nock.Jets.mor/1, :enabled, 30},
    Jets.calculate_mug_of_core(22, 10) =>
      {"silt", 7, @layer_10_context_mug, &Nock.Jets.silt/1, :enabled, 30},
    Jets.calculate_mug_of_param_core(84, 21, 10) =>
      {"put", 7, @layer_10_in_context_mug, &Nock.Jets.put/1, :enabled, 30},
    Jets.calculate_mug_of_param_core(174, 21, 10) =>
      {"uni", 7, @layer_10_in_context_mug, &Nock.Jets.uni/1, :enabled, 30},
    Jets.calculate_mug_of_param_core(85, 21, 10) =>
      {"int", 7, @layer_10_in_context_mug, &Nock.Jets.int/1, :enabled, 30},
    Jets.calculate_mug_of_param_core(175, 21, 10) =>
      {"dif", 7, @layer_10_in_context_mug, &Nock.Jets.sdif/1, :enabled, 30},
    Jets.calculate_mug_of_param_core(763, 21, 10) =>
      {"duni", 7, @layer_10_in_context_mug, &Nock.Jets.duni/1, :enabled, 30},
    Jets.calculate_mug_of_param_core(762, 21, 10) =>
      {"has", 7, @layer_10_in_context_mug, &Nock.Jets.has/1, :enabled, 30},
    Jets.calculate_mug_of_param_core(340, 21, 11) =>
      {"put", 7, @layer_11_in_context_mug, &Nock.Jets.mput/1, :enabled, 30},
    Jets.calculate_mug_of_param_core(701, 21, 11) =>
      {"got", 7, @layer_11_in_context_mug, &Nock.Jets.got/1, :enabled, 30},
    Jets.calculate_mug_of_core(1492, Nock.Lib.stdlib_layers()) =>
      {"kind", 7, @layer_rm_context_mug, &Nock.Jets.kind/1, :enabled, 100},
    Jets.calculate_mug_of_core(92, Nock.Lib.stdlib_layers()) =>
      {"delta-add", 7, @layer_rm_context_mug, &Nock.Jets.delta_add/1,
       :enabled, 50},
    Jets.calculate_mug_of_core(1527, Nock.Lib.stdlib_layers()) =>
      {"delta-sub", 7, @layer_rm_context_mug, &Nock.Jets.delta_sub/1,
       :enabled, 50},
    Jets.calculate_mug_of_core(4, Nock.Lib.stdlib_layers()) =>
      {"action-delta", 7, @layer_rm_context_mug, &Nock.Jets.action_delta/1,
       :enabled, 50},
    Jets.calculate_mug_of_core(1494, Nock.Lib.stdlib_layers()) =>
      {"make-delta", 7, @layer_rm_context_mug, &Nock.Jets.make_delta/1,
       :enabled, 50}
  }

  @doc """
  Gives the jet registry
  """
  @spec jet_registry() :: map()
  def jet_registry, do: @jet_registry
end

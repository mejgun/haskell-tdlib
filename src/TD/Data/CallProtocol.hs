{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.CallProtocol where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data CallProtocol = -- | Specifies the supported call protocols
  CallProtocol
  { -- | List of supported tgcalls versions
    library_versions :: Maybe [String],
    -- | The maximum supported API layer; use 92
    max_layer :: Maybe Int,
    -- | The minimum supported API layer; use 65
    min_layer :: Maybe Int,
    -- | True, if connection through UDP reflectors is supported
    udp_reflector :: Maybe Bool,
    -- | True, if UDP peer-to-peer connections are supported
    udp_p2p :: Maybe Bool
  }
  deriving (Eq)

instance Show CallProtocol where
  show
    CallProtocol
      { library_versions = library_versions_,
        max_layer = max_layer_,
        min_layer = min_layer_,
        udp_reflector = udp_reflector_,
        udp_p2p = udp_p2p_
      } =
      "CallProtocol"
        ++ U.cc
          [ U.p "library_versions" library_versions_,
            U.p "max_layer" max_layer_,
            U.p "min_layer" min_layer_,
            U.p "udp_reflector" udp_reflector_,
            U.p "udp_p2p" udp_p2p_
          ]

instance T.FromJSON CallProtocol where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "callProtocol" -> parseCallProtocol v
      _ -> mempty
    where
      parseCallProtocol :: A.Value -> T.Parser CallProtocol
      parseCallProtocol = A.withObject "CallProtocol" $ \o -> do
        library_versions_ <- o A..:? "library_versions"
        max_layer_ <- o A..:? "max_layer"
        min_layer_ <- o A..:? "min_layer"
        udp_reflector_ <- o A..:? "udp_reflector"
        udp_p2p_ <- o A..:? "udp_p2p"
        return $ CallProtocol {library_versions = library_versions_, max_layer = max_layer_, min_layer = min_layer_, udp_reflector = udp_reflector_, udp_p2p = udp_p2p_}
  parseJSON _ = mempty

instance T.ToJSON CallProtocol where
  toJSON
    CallProtocol
      { library_versions = library_versions_,
        max_layer = max_layer_,
        min_layer = min_layer_,
        udp_reflector = udp_reflector_,
        udp_p2p = udp_p2p_
      } =
      A.object
        [ "@type" A..= T.String "callProtocol",
          "library_versions" A..= library_versions_,
          "max_layer" A..= max_layer_,
          "min_layer" A..= min_layer_,
          "udp_reflector" A..= udp_reflector_,
          "udp_p2p" A..= udp_p2p_
        ]

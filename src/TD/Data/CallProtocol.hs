module TD.Data.CallProtocol
  ( CallProtocol(..)    
  , defaultCallProtocol 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data CallProtocol
  = CallProtocol -- ^ Specifies the supported call protocols
    { udp_p2p          :: Maybe Bool     -- ^ True, if UDP peer-to-peer connections are supported
    , udp_reflector    :: Maybe Bool     -- ^ True, if connection through UDP reflectors is supported
    , min_layer        :: Maybe Int      -- ^ The minimum supported API layer; use 65
    , max_layer        :: Maybe Int      -- ^ The maximum supported API layer; use 92
    , library_versions :: Maybe [T.Text] -- ^ List of supported tgcalls versions
    }
  deriving (Eq, Show)

instance I.ShortShow CallProtocol where
  shortShow CallProtocol
    { udp_p2p          = udp_p2p_
    , udp_reflector    = udp_reflector_
    , min_layer        = min_layer_
    , max_layer        = max_layer_
    , library_versions = library_versions_
    }
      = "CallProtocol"
        ++ I.cc
        [ "udp_p2p"          `I.p` udp_p2p_
        , "udp_reflector"    `I.p` udp_reflector_
        , "min_layer"        `I.p` min_layer_
        , "max_layer"        `I.p` max_layer_
        , "library_versions" `I.p` library_versions_
        ]

instance AT.FromJSON CallProtocol where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "callProtocol" -> parseCallProtocol v
      _              -> mempty
    
    where
      parseCallProtocol :: A.Value -> AT.Parser CallProtocol
      parseCallProtocol = A.withObject "CallProtocol" $ \o -> do
        udp_p2p_          <- o A..:?  "udp_p2p"
        udp_reflector_    <- o A..:?  "udp_reflector"
        min_layer_        <- o A..:?  "min_layer"
        max_layer_        <- o A..:?  "max_layer"
        library_versions_ <- o A..:?  "library_versions"
        pure $ CallProtocol
          { udp_p2p          = udp_p2p_
          , udp_reflector    = udp_reflector_
          , min_layer        = min_layer_
          , max_layer        = max_layer_
          , library_versions = library_versions_
          }
  parseJSON _ = mempty

instance AT.ToJSON CallProtocol where
  toJSON CallProtocol
    { udp_p2p          = udp_p2p_
    , udp_reflector    = udp_reflector_
    , min_layer        = min_layer_
    , max_layer        = max_layer_
    , library_versions = library_versions_
    }
      = A.object
        [ "@type"            A..= AT.String "callProtocol"
        , "udp_p2p"          A..= udp_p2p_
        , "udp_reflector"    A..= udp_reflector_
        , "min_layer"        A..= min_layer_
        , "max_layer"        A..= max_layer_
        , "library_versions" A..= library_versions_
        ]

defaultCallProtocol :: CallProtocol
defaultCallProtocol =
  CallProtocol
    { udp_p2p          = Nothing
    , udp_reflector    = Nothing
    , min_layer        = Nothing
    , max_layer        = Nothing
    , library_versions = Nothing
    }


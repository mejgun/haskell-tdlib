module TD.Data.TonCenterApiRequestType
  (TonCenterApiRequestType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes a type of request to the TON Center API
data TonCenterApiRequestType
  = TonCenterApiRequestTypeGet -- ^ A GET request
    { query :: Maybe T.Text -- ^ URL-encoded query of the request
    }
  | TonCenterApiRequestTypePost -- ^ A POST request
    { payload :: Maybe T.Text -- ^ Payload of the request
    }
  deriving (Eq, Show)

instance I.ShortShow TonCenterApiRequestType where
  shortShow TonCenterApiRequestTypeGet
    { query = query_
    }
      = "TonCenterApiRequestTypeGet"
        ++ I.cc
        [ "query" `I.p` query_
        ]
  shortShow TonCenterApiRequestTypePost
    { payload = payload_
    }
      = "TonCenterApiRequestTypePost"
        ++ I.cc
        [ "payload" `I.p` payload_
        ]

instance AT.FromJSON TonCenterApiRequestType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonCenterApiRequestTypeGet"  -> parseTonCenterApiRequestTypeGet v
      "tonCenterApiRequestTypePost" -> parseTonCenterApiRequestTypePost v
      _                             -> mempty
    
    where
      parseTonCenterApiRequestTypeGet :: A.Value -> AT.Parser TonCenterApiRequestType
      parseTonCenterApiRequestTypeGet = A.withObject "TonCenterApiRequestTypeGet" $ \o -> do
        query_ <- o A..:?  "query"
        pure $ TonCenterApiRequestTypeGet
          { query = query_
          }
      parseTonCenterApiRequestTypePost :: A.Value -> AT.Parser TonCenterApiRequestType
      parseTonCenterApiRequestTypePost = A.withObject "TonCenterApiRequestTypePost" $ \o -> do
        payload_ <- o A..:?  "payload"
        pure $ TonCenterApiRequestTypePost
          { payload = payload_
          }
  parseJSON _ = mempty

instance AT.ToJSON TonCenterApiRequestType where
  toJSON TonCenterApiRequestTypeGet
    { query = query_
    }
      = A.object
        [ "@type" A..= AT.String "tonCenterApiRequestTypeGet"
        , "query" A..= query_
        ]
  toJSON TonCenterApiRequestTypePost
    { payload = payload_
    }
      = A.object
        [ "@type"   A..= AT.String "tonCenterApiRequestTypePost"
        , "payload" A..= payload_
        ]


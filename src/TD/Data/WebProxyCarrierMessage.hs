module TD.Data.WebProxyCarrierMessage
  (WebProxyCarrierMessage(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified Data.ByteString as BS

-- | Describes a message passed by the page of a web proxy carrier to postMessage of the bridge object
data WebProxyCarrierMessage
  = WebProxyCarrierMessageText -- ^ A string message
    { text :: Maybe T.Text -- ^ The string
    }
  | WebProxyCarrierMessageBinary -- ^ A binary message, passed as an ArrayBuffer or a typed array
    { _data :: Maybe BS.ByteString -- ^ Data of the message
    }
  deriving (Eq, Show)

instance I.ShortShow WebProxyCarrierMessage where
  shortShow WebProxyCarrierMessageText
    { text = text_
    }
      = "WebProxyCarrierMessageText"
        ++ I.cc
        [ "text" `I.p` text_
        ]
  shortShow WebProxyCarrierMessageBinary
    { _data = _data_
    }
      = "WebProxyCarrierMessageBinary"
        ++ I.cc
        [ "_data" `I.p` _data_
        ]

instance AT.FromJSON WebProxyCarrierMessage where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "webProxyCarrierMessageText"   -> parseWebProxyCarrierMessageText v
      "webProxyCarrierMessageBinary" -> parseWebProxyCarrierMessageBinary v
      _                              -> mempty
    
    where
      parseWebProxyCarrierMessageText :: A.Value -> AT.Parser WebProxyCarrierMessage
      parseWebProxyCarrierMessageText = A.withObject "WebProxyCarrierMessageText" $ \o -> do
        text_ <- o A..:?  "text"
        pure $ WebProxyCarrierMessageText
          { text = text_
          }
      parseWebProxyCarrierMessageBinary :: A.Value -> AT.Parser WebProxyCarrierMessage
      parseWebProxyCarrierMessageBinary = A.withObject "WebProxyCarrierMessageBinary" $ \o -> do
        _data_ <- fmap I.readBytes <$> o A..:?  "data"
        pure $ WebProxyCarrierMessageBinary
          { _data = _data_
          }
  parseJSON _ = mempty

instance AT.ToJSON WebProxyCarrierMessage where
  toJSON WebProxyCarrierMessageText
    { text = text_
    }
      = A.object
        [ "@type" A..= AT.String "webProxyCarrierMessageText"
        , "text"  A..= text_
        ]
  toJSON WebProxyCarrierMessageBinary
    { _data = _data_
    }
      = A.object
        [ "@type" A..= AT.String "webProxyCarrierMessageBinary"
        , "data"  A..= fmap I.writeBytes  _data_
        ]


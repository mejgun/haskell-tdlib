module TD.Data.SentWebAppMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data SentWebAppMessage
  = SentWebAppMessage -- ^ Information about the message sent by answerWebAppQuery
    { inline_message_id :: Maybe T.Text -- ^ Identifier of the sent inline message, if known
    }
  deriving (Eq)

instance Show SentWebAppMessage where
  show SentWebAppMessage
    { inline_message_id = inline_message_id_
    }
      = "SentWebAppMessage"
        ++ I.cc
        [ "inline_message_id" `I.p` inline_message_id_
        ]

instance AT.FromJSON SentWebAppMessage where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "sentWebAppMessage" -> parseSentWebAppMessage v
      _                   -> mempty
    
    where
      parseSentWebAppMessage :: A.Value -> AT.Parser SentWebAppMessage
      parseSentWebAppMessage = A.withObject "SentWebAppMessage" $ \o -> do
        inline_message_id_ <- o A..:?  "inline_message_id"
        pure $ SentWebAppMessage
          { inline_message_id = inline_message_id_
          }

instance AT.ToJSON SentWebAppMessage where
  toJSON SentWebAppMessage
    { inline_message_id = inline_message_id_
    }
      = A.object
        [ "@type"             A..= AT.String "sentWebAppMessage"
        , "inline_message_id" A..= inline_message_id_
        ]

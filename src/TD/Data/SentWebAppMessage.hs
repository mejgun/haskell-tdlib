module TD.Data.SentWebAppMessage
  (SentWebAppMessage(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data SentWebAppMessage
  = SentWebAppMessage -- ^ Information about the message sent by answerWebAppQuery
    { inline_message_id :: Maybe T.Text -- ^ Identifier of the sent inline message, if known
    }
  deriving (Eq, Show)

instance I.ShortShow SentWebAppMessage where
  shortShow SentWebAppMessage
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
  parseJSON _ = mempty


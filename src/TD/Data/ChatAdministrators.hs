module TD.Data.ChatAdministrators
  (ChatAdministrators(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatAdministrator as ChatAdministrator

data ChatAdministrators
  = ChatAdministrators -- ^ Represents a list of chat administrators
    { administrators :: Maybe [ChatAdministrator.ChatAdministrator] -- ^ A list of chat administrators
    }
  deriving (Eq, Show)

instance I.ShortShow ChatAdministrators where
  shortShow ChatAdministrators
    { administrators = administrators_
    }
      = "ChatAdministrators"
        ++ I.cc
        [ "administrators" `I.p` administrators_
        ]

instance AT.FromJSON ChatAdministrators where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatAdministrators" -> parseChatAdministrators v
      _                    -> mempty
    
    where
      parseChatAdministrators :: A.Value -> AT.Parser ChatAdministrators
      parseChatAdministrators = A.withObject "ChatAdministrators" $ \o -> do
        administrators_ <- o A..:?  "administrators"
        pure $ ChatAdministrators
          { administrators = administrators_
          }
  parseJSON _ = mempty


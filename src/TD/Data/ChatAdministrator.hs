module TD.Data.ChatAdministrator
  (ChatAdministrator(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data ChatAdministrator
  = ChatAdministrator -- ^ Contains information about a chat administrator
    { user_id      :: Maybe Int    -- ^ User identifier of the administrator
    , custom_title :: Maybe T.Text -- ^ Custom title of the administrator
    , is_owner     :: Maybe Bool   -- ^ True, if the user is the owner of the chat
    }
  deriving (Eq, Show)

instance I.ShortShow ChatAdministrator where
  shortShow ChatAdministrator
    { user_id      = user_id_
    , custom_title = custom_title_
    , is_owner     = is_owner_
    }
      = "ChatAdministrator"
        ++ I.cc
        [ "user_id"      `I.p` user_id_
        , "custom_title" `I.p` custom_title_
        , "is_owner"     `I.p` is_owner_
        ]

instance AT.FromJSON ChatAdministrator where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatAdministrator" -> parseChatAdministrator v
      _                   -> mempty
    
    where
      parseChatAdministrator :: A.Value -> AT.Parser ChatAdministrator
      parseChatAdministrator = A.withObject "ChatAdministrator" $ \o -> do
        user_id_      <- o A..:?  "user_id"
        custom_title_ <- o A..:?  "custom_title"
        is_owner_     <- o A..:?  "is_owner"
        pure $ ChatAdministrator
          { user_id      = user_id_
          , custom_title = custom_title_
          , is_owner     = is_owner_
          }
  parseJSON _ = mempty


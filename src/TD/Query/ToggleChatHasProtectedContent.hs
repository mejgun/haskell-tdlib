module TD.Query.ToggleChatHasProtectedContent
  (ToggleChatHasProtectedContent(..)
  , defaultToggleChatHasProtectedContent
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the ability of users to save, forward, or copy chat content. Supported only for basic groups, supergroups and channels. Requires owner privileges. Returns 'TD.Data.Ok.Ok'
data ToggleChatHasProtectedContent
  = ToggleChatHasProtectedContent
    { chat_id               :: Maybe Int  -- ^ Chat identifier
    , has_protected_content :: Maybe Bool -- ^ New value of has_protected_content
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleChatHasProtectedContent where
  shortShow
    ToggleChatHasProtectedContent
      { chat_id               = chat_id_
      , has_protected_content = has_protected_content_
      }
        = "ToggleChatHasProtectedContent"
          ++ I.cc
          [ "chat_id"               `I.p` chat_id_
          , "has_protected_content" `I.p` has_protected_content_
          ]

instance AT.ToJSON ToggleChatHasProtectedContent where
  toJSON
    ToggleChatHasProtectedContent
      { chat_id               = chat_id_
      , has_protected_content = has_protected_content_
      }
        = A.object
          [ "@type"                 A..= AT.String "toggleChatHasProtectedContent"
          , "chat_id"               A..= chat_id_
          , "has_protected_content" A..= has_protected_content_
          ]

defaultToggleChatHasProtectedContent :: ToggleChatHasProtectedContent
defaultToggleChatHasProtectedContent =
  ToggleChatHasProtectedContent
    { chat_id               = Nothing
    , has_protected_content = Nothing
    }


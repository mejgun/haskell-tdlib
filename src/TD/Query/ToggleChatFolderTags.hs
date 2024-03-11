module TD.Query.ToggleChatFolderTags
  (ToggleChatFolderTags(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether chat folder tags are enabled. Returns 'TD.Data.Ok.Ok'
data ToggleChatFolderTags
  = ToggleChatFolderTags
    { are_tags_enabled :: Maybe Bool -- ^ Pass true to enable folder tags; pass false to disable them
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleChatFolderTags where
  shortShow
    ToggleChatFolderTags
      { are_tags_enabled = are_tags_enabled_
      }
        = "ToggleChatFolderTags"
          ++ I.cc
          [ "are_tags_enabled" `I.p` are_tags_enabled_
          ]

instance AT.ToJSON ToggleChatFolderTags where
  toJSON
    ToggleChatFolderTags
      { are_tags_enabled = are_tags_enabled_
      }
        = A.object
          [ "@type"            A..= AT.String "toggleChatFolderTags"
          , "are_tags_enabled" A..= are_tags_enabled_
          ]


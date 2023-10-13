module TD.Query.GetAttachmentMenuBot
  (GetAttachmentMenuBot(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a bot that can be added to attachment menu
data GetAttachmentMenuBot
  = GetAttachmentMenuBot
    { bot_user_id :: Maybe Int -- ^ Bot's user identifier
    }
  deriving (Eq)

instance Show GetAttachmentMenuBot where
  show
    GetAttachmentMenuBot
      { bot_user_id = bot_user_id_
      }
        = "GetAttachmentMenuBot"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          ]

instance AT.ToJSON GetAttachmentMenuBot where
  toJSON
    GetAttachmentMenuBot
      { bot_user_id = bot_user_id_
      }
        = A.object
          [ "@type"       A..= AT.String "getAttachmentMenuBot"
          , "bot_user_id" A..= bot_user_id_
          ]


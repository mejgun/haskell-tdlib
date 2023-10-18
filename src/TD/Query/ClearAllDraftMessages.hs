module TD.Query.ClearAllDraftMessages
  (ClearAllDraftMessages(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Clears message drafts in all chats. Returns 'TD.Data.Ok.Ok'
data ClearAllDraftMessages
  = ClearAllDraftMessages
    { exclude_secret_chats :: Maybe Bool -- ^ Pass true to keep local message drafts in secret chats
    }
  deriving (Eq, Show)

instance I.ShortShow ClearAllDraftMessages where
  shortShow
    ClearAllDraftMessages
      { exclude_secret_chats = exclude_secret_chats_
      }
        = "ClearAllDraftMessages"
          ++ I.cc
          [ "exclude_secret_chats" `I.p` exclude_secret_chats_
          ]

instance AT.ToJSON ClearAllDraftMessages where
  toJSON
    ClearAllDraftMessages
      { exclude_secret_chats = exclude_secret_chats_
      }
        = A.object
          [ "@type"                A..= AT.String "clearAllDraftMessages"
          , "exclude_secret_chats" A..= exclude_secret_chats_
          ]


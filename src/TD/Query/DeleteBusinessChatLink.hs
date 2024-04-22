module TD.Query.DeleteBusinessChatLink
  (DeleteBusinessChatLink(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Deletes a business chat link of the current account. Returns 'TD.Data.Ok.Ok'
data DeleteBusinessChatLink
  = DeleteBusinessChatLink
    { link :: Maybe T.Text -- ^ The link to delete
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteBusinessChatLink where
  shortShow
    DeleteBusinessChatLink
      { link = link_
      }
        = "DeleteBusinessChatLink"
          ++ I.cc
          [ "link" `I.p` link_
          ]

instance AT.ToJSON DeleteBusinessChatLink where
  toJSON
    DeleteBusinessChatLink
      { link = link_
      }
        = A.object
          [ "@type" A..= AT.String "deleteBusinessChatLink"
          , "link"  A..= link_
          ]


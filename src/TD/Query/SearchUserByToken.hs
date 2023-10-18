module TD.Query.SearchUserByToken
  (SearchUserByToken(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches a user by a token from the user's link. Returns 'TD.Data.User.User'
data SearchUserByToken
  = SearchUserByToken
    { token :: Maybe T.Text -- ^ Token to search for
    }
  deriving (Eq, Show)

instance I.ShortShow SearchUserByToken where
  shortShow
    SearchUserByToken
      { token = token_
      }
        = "SearchUserByToken"
          ++ I.cc
          [ "token" `I.p` token_
          ]

instance AT.ToJSON SearchUserByToken where
  toJSON
    SearchUserByToken
      { token = token_
      }
        = A.object
          [ "@type" A..= AT.String "searchUserByToken"
          , "token" A..= token_
          ]


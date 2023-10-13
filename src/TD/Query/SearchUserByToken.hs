module TD.Query.SearchUserByToken
  (SearchUserByToken(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data SearchUserByToken -- ^ Searches a user by a token from the user's link
  = SearchUserByToken
    { token :: Maybe T.Text -- ^ Token to search for
    }
  deriving (Eq)

instance Show SearchUserByToken where
  show
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


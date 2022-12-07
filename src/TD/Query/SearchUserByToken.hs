{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SearchUserByToken where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches a user by a token from the user's link @token Token to search for
data SearchUserByToken = SearchUserByToken
  { -- |
    token :: Maybe String
  }
  deriving (Eq)

instance Show SearchUserByToken where
  show
    SearchUserByToken
      { token = token_
      } =
      "SearchUserByToken"
        ++ U.cc
          [ U.p "token" token_
          ]

instance T.ToJSON SearchUserByToken where
  toJSON
    SearchUserByToken
      { token = token_
      } =
      A.object
        [ "@type" A..= T.String "searchUserByToken",
          "token" A..= token_
        ]

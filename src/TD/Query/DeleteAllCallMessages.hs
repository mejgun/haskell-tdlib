{-# LANGUAGE OverloadedStrings #-}

module TD.Query.DeleteAllCallMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes all call messages @revoke Pass true to delete the messages for all users
data DeleteAllCallMessages = DeleteAllCallMessages
  { -- |
    revoke :: Maybe Bool
  }
  deriving (Eq)

instance Show DeleteAllCallMessages where
  show
    DeleteAllCallMessages
      { revoke = revoke
      } =
      "DeleteAllCallMessages"
        ++ U.cc
          [ U.p "revoke" revoke
          ]

instance T.ToJSON DeleteAllCallMessages where
  toJSON
    DeleteAllCallMessages
      { revoke = revoke
      } =
      A.object
        [ "@type" A..= T.String "deleteAllCallMessages",
          "revoke" A..= revoke
        ]

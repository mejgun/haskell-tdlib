{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DeleteSavedOrderInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes saved order information
data DeleteSavedOrderInfo = DeleteSavedOrderInfo
  {
  }
  deriving (Eq)

instance Show DeleteSavedOrderInfo where
  show DeleteSavedOrderInfo =
    "DeleteSavedOrderInfo"
      ++ U.cc
        []

instance T.ToJSON DeleteSavedOrderInfo where
  toJSON DeleteSavedOrderInfo =
    A.object
      [ "@type" A..= T.String "deleteSavedOrderInfo"
      ]

{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetDefaultMessageTtl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns default message Time To Live setting (self-destruct timer) for new chats
data GetDefaultMessageTtl = GetDefaultMessageTtl
  {
  }
  deriving (Eq)

instance Show GetDefaultMessageTtl where
  show GetDefaultMessageTtl =
    "GetDefaultMessageTtl"
      ++ U.cc
        []

instance T.ToJSON GetDefaultMessageTtl where
  toJSON GetDefaultMessageTtl =
    A.object
      [ "@type" A..= T.String "getDefaultMessageTtl"
      ]

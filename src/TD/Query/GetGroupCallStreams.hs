{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetGroupCallStreams where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about available group call streams @group_call_id Group call identifier
data GetGroupCallStreams = GetGroupCallStreams
  { -- |
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetGroupCallStreams where
  show
    GetGroupCallStreams
      { group_call_id = group_call_id_
      } =
      "GetGroupCallStreams"
        ++ U.cc
          [ U.p "group_call_id" group_call_id_
          ]

instance T.ToJSON GetGroupCallStreams where
  toJSON
    GetGroupCallStreams
      { group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "getGroupCallStreams",
          "group_call_id" A..= group_call_id_
        ]

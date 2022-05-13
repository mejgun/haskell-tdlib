{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetGroupCallTitle where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sets group call title. Requires groupCall.can_be_managed group call flag @group_call_id Group call identifier @title New group call title; 1-64 characters
data SetGroupCallTitle = SetGroupCallTitle
  { -- |
    title :: Maybe String,
    -- |
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetGroupCallTitle where
  show
    SetGroupCallTitle
      { title = title_,
        group_call_id = group_call_id_
      } =
      "SetGroupCallTitle"
        ++ U.cc
          [ U.p "title" title_,
            U.p "group_call_id" group_call_id_
          ]

instance T.ToJSON SetGroupCallTitle where
  toJSON
    SetGroupCallTitle
      { title = title_,
        group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "setGroupCallTitle",
          "title" A..= title_,
          "group_call_id" A..= group_call_id_
        ]

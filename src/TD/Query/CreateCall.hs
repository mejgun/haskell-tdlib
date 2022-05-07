{-# LANGUAGE OverloadedStrings #-}

module TD.Query.CreateCall where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.CallProtocol as CallProtocol
import qualified Utils as U

-- |
-- Creates a new call @user_id Identifier of the user to be called @protocol The call protocols supported by the application @is_video Pass true to create a video call
data CreateCall = CreateCall
  { -- |
    is_video :: Maybe Bool,
    -- |
    protocol :: Maybe CallProtocol.CallProtocol,
    -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show CreateCall where
  show
    CreateCall
      { is_video = is_video,
        protocol = protocol,
        user_id = user_id
      } =
      "CreateCall"
        ++ U.cc
          [ U.p "is_video" is_video,
            U.p "protocol" protocol,
            U.p "user_id" user_id
          ]

instance T.ToJSON CreateCall where
  toJSON
    CreateCall
      { is_video = is_video,
        protocol = protocol,
        user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "createCall",
          "is_video" A..= is_video,
          "protocol" A..= protocol,
          "user_id" A..= user_id
        ]

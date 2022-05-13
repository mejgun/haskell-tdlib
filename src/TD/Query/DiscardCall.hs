{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DiscardCall where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Discards a call @call_id Call identifier @is_disconnected Pass true if the user was disconnected @duration The call duration, in seconds @is_video Pass true if the call was a video call @connection_id Identifier of the connection used during the call
data DiscardCall = DiscardCall
  { -- |
    connection_id :: Maybe Int,
    -- |
    is_video :: Maybe Bool,
    -- |
    duration :: Maybe Int,
    -- |
    is_disconnected :: Maybe Bool,
    -- |
    call_id :: Maybe Int
  }
  deriving (Eq)

instance Show DiscardCall where
  show
    DiscardCall
      { connection_id = connection_id_,
        is_video = is_video_,
        duration = duration_,
        is_disconnected = is_disconnected_,
        call_id = call_id_
      } =
      "DiscardCall"
        ++ U.cc
          [ U.p "connection_id" connection_id_,
            U.p "is_video" is_video_,
            U.p "duration" duration_,
            U.p "is_disconnected" is_disconnected_,
            U.p "call_id" call_id_
          ]

instance T.ToJSON DiscardCall where
  toJSON
    DiscardCall
      { connection_id = connection_id_,
        is_video = is_video_,
        duration = duration_,
        is_disconnected = is_disconnected_,
        call_id = call_id_
      } =
      A.object
        [ "@type" A..= T.String "discardCall",
          "connection_id" A..= connection_id_,
          "is_video" A..= is_video_,
          "duration" A..= duration_,
          "is_disconnected" A..= is_disconnected_,
          "call_id" A..= call_id_
        ]

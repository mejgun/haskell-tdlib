{-# LANGUAGE OverloadedStrings #-}

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
      { connection_id = connection_id,
        is_video = is_video,
        duration = duration,
        is_disconnected = is_disconnected,
        call_id = call_id
      } =
      "DiscardCall"
        ++ U.cc
          [ U.p "connection_id" connection_id,
            U.p "is_video" is_video,
            U.p "duration" duration,
            U.p "is_disconnected" is_disconnected,
            U.p "call_id" call_id
          ]

instance T.ToJSON DiscardCall where
  toJSON
    DiscardCall
      { connection_id = connection_id,
        is_video = is_video,
        duration = duration,
        is_disconnected = is_disconnected,
        call_id = call_id
      } =
      A.object
        [ "@type" A..= T.String "discardCall",
          "connection_id" A..= connection_id,
          "is_video" A..= is_video,
          "duration" A..= duration,
          "is_disconnected" A..= is_disconnected,
          "call_id" A..= call_id
        ]

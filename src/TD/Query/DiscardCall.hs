{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DiscardCall where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Discards a call
data DiscardCall = DiscardCall
  { -- | Identifier of the connection used during the call
    connection_id :: Maybe Int,
    -- | Pass true if the call was a video call
    is_video :: Maybe Bool,
    -- | The call duration, in seconds
    duration :: Maybe Int,
    -- | Pass true if the user was disconnected
    is_disconnected :: Maybe Bool,
    -- | Call identifier
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
          "connection_id" A..= U.toS connection_id_,
          "is_video" A..= is_video_,
          "duration" A..= duration_,
          "is_disconnected" A..= is_disconnected_,
          "call_id" A..= call_id_
        ]

{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Call where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.CallState as CallState
import qualified Utils as U

-- |
data Call = -- | Describes a call
  Call
  { -- | Call state
    state :: Maybe CallState.CallState,
    -- | True, if the call is a video call
    is_video :: Maybe Bool,
    -- | True, if the call is outgoing
    is_outgoing :: Maybe Bool,
    -- | Peer user identifier
    user_id :: Maybe Int,
    -- | Call identifier, not persistent
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show Call where
  show
    Call
      { state = state_,
        is_video = is_video_,
        is_outgoing = is_outgoing_,
        user_id = user_id_,
        _id = _id_
      } =
      "Call"
        ++ U.cc
          [ U.p "state" state_,
            U.p "is_video" is_video_,
            U.p "is_outgoing" is_outgoing_,
            U.p "user_id" user_id_,
            U.p "_id" _id_
          ]

instance T.FromJSON Call where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "call" -> parseCall v
      _ -> mempty
    where
      parseCall :: A.Value -> T.Parser Call
      parseCall = A.withObject "Call" $ \o -> do
        state_ <- o A..:? "state"
        is_video_ <- o A..:? "is_video"
        is_outgoing_ <- o A..:? "is_outgoing"
        user_id_ <- o A..:? "user_id"
        _id_ <- o A..:? "id"
        return $ Call {state = state_, is_video = is_video_, is_outgoing = is_outgoing_, user_id = user_id_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON Call where
  toJSON
    Call
      { state = state_,
        is_video = is_video_,
        is_outgoing = is_outgoing_,
        user_id = user_id_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "call",
          "state" A..= state_,
          "is_video" A..= is_video_,
          "is_outgoing" A..= is_outgoing_,
          "user_id" A..= user_id_,
          "id" A..= _id_
        ]

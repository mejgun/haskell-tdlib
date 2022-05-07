{-# LANGUAGE OverloadedStrings #-}

module TD.Data.Call where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.CallState as CallState
import qualified Utils as U

data Call = -- | Describes a call @id Call identifier, not persistent @user_id Peer user identifier @is_outgoing True, if the call is outgoing @is_video True, if the call is a video call @state Call state
  Call
  { -- |
    state :: Maybe CallState.CallState,
    -- |
    is_video :: Maybe Bool,
    -- |
    is_outgoing :: Maybe Bool,
    -- |
    user_id :: Maybe Int,
    -- |
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show Call where
  show
    Call
      { state = state,
        is_video = is_video,
        is_outgoing = is_outgoing,
        user_id = user_id,
        _id = _id
      } =
      "Call"
        ++ U.cc
          [ U.p "state" state,
            U.p "is_video" is_video,
            U.p "is_outgoing" is_outgoing,
            U.p "user_id" user_id,
            U.p "_id" _id
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
        user_id_ <- mconcat [o A..:? "user_id", U.rm <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ Call {state = state_, is_video = is_video_, is_outgoing = is_outgoing_, user_id = user_id_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON Call where
  toJSON
    Call
      { state = state,
        is_video = is_video,
        is_outgoing = is_outgoing,
        user_id = user_id,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "call",
          "state" A..= state,
          "is_video" A..= is_video,
          "is_outgoing" A..= is_outgoing,
          "user_id" A..= user_id,
          "id" A..= _id
        ]

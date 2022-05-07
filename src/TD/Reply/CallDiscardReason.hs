{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.CallDiscardReason where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes the reason why a call was discarded
data CallDiscardReason
  = -- | The call wasn't discarded, or the reason is unknown
    CallDiscardReasonEmpty
  | -- | The call was ended before the conversation started. It was canceled by the caller or missed by the other party
    CallDiscardReasonMissed
  | -- | The call was ended before the conversation started. It was declined by the other party
    CallDiscardReasonDeclined
  | -- | The call was ended during the conversation because the users were disconnected
    CallDiscardReasonDisconnected
  | -- | The call was ended because one of the parties hung up
    CallDiscardReasonHungUp
  deriving (Eq)

instance Show CallDiscardReason where
  show CallDiscardReasonEmpty =
    "CallDiscardReasonEmpty"
      ++ U.cc
        []
  show CallDiscardReasonMissed =
    "CallDiscardReasonMissed"
      ++ U.cc
        []
  show CallDiscardReasonDeclined =
    "CallDiscardReasonDeclined"
      ++ U.cc
        []
  show CallDiscardReasonDisconnected =
    "CallDiscardReasonDisconnected"
      ++ U.cc
        []
  show CallDiscardReasonHungUp =
    "CallDiscardReasonHungUp"
      ++ U.cc
        []

instance T.FromJSON CallDiscardReason where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "callDiscardReasonEmpty" -> parseCallDiscardReasonEmpty v
      "callDiscardReasonMissed" -> parseCallDiscardReasonMissed v
      "callDiscardReasonDeclined" -> parseCallDiscardReasonDeclined v
      "callDiscardReasonDisconnected" -> parseCallDiscardReasonDisconnected v
      "callDiscardReasonHungUp" -> parseCallDiscardReasonHungUp v
      _ -> fail ""
    where
      parseCallDiscardReasonEmpty :: A.Value -> T.Parser CallDiscardReason
      parseCallDiscardReasonEmpty = A.withObject "CallDiscardReasonEmpty" $ \o -> do
        return $ CallDiscardReasonEmpty {}

      parseCallDiscardReasonMissed :: A.Value -> T.Parser CallDiscardReason
      parseCallDiscardReasonMissed = A.withObject "CallDiscardReasonMissed" $ \o -> do
        return $ CallDiscardReasonMissed {}

      parseCallDiscardReasonDeclined :: A.Value -> T.Parser CallDiscardReason
      parseCallDiscardReasonDeclined = A.withObject "CallDiscardReasonDeclined" $ \o -> do
        return $ CallDiscardReasonDeclined {}

      parseCallDiscardReasonDisconnected :: A.Value -> T.Parser CallDiscardReason
      parseCallDiscardReasonDisconnected = A.withObject "CallDiscardReasonDisconnected" $ \o -> do
        return $ CallDiscardReasonDisconnected {}

      parseCallDiscardReasonHungUp :: A.Value -> T.Parser CallDiscardReason
      parseCallDiscardReasonHungUp = A.withObject "CallDiscardReasonHungUp" $ \o -> do
        return $ CallDiscardReasonHungUp {}
  parseJSON _ = fail ""

instance T.ToJSON CallDiscardReason where
  toJSON CallDiscardReasonEmpty =
    A.object
      [ "@type" A..= T.String "callDiscardReasonEmpty"
      ]
  toJSON CallDiscardReasonMissed =
    A.object
      [ "@type" A..= T.String "callDiscardReasonMissed"
      ]
  toJSON CallDiscardReasonDeclined =
    A.object
      [ "@type" A..= T.String "callDiscardReasonDeclined"
      ]
  toJSON CallDiscardReasonDisconnected =
    A.object
      [ "@type" A..= T.String "callDiscardReasonDisconnected"
      ]
  toJSON CallDiscardReasonHungUp =
    A.object
      [ "@type" A..= T.String "callDiscardReasonHungUp"
      ]

{-# LANGUAGE OverloadedStrings #-}

module TD.Data.ChatReportReason where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes the reason why a chat is reported
data ChatReportReason
  = -- | The chat contains spam messages
    ChatReportReasonSpam
  | -- | The chat promotes violence
    ChatReportReasonViolence
  | -- | The chat contains pornographic messages
    ChatReportReasonPornography
  | -- | The chat has child abuse related content
    ChatReportReasonChildAbuse
  | -- | The chat contains copyrighted content
    ChatReportReasonCopyright
  | -- | The location-based chat is unrelated to its stated location
    ChatReportReasonUnrelatedLocation
  | -- | The chat represents a fake account
    ChatReportReasonFake
  | -- | The chat has illegal drugs related content
    ChatReportReasonIllegalDrugs
  | -- | The chat contains messages with personal details
    ChatReportReasonPersonalDetails
  | -- | A custom reason provided by the user
    ChatReportReasonCustom
  deriving (Eq)

instance Show ChatReportReason where
  show ChatReportReasonSpam =
    "ChatReportReasonSpam"
      ++ U.cc
        []
  show ChatReportReasonViolence =
    "ChatReportReasonViolence"
      ++ U.cc
        []
  show ChatReportReasonPornography =
    "ChatReportReasonPornography"
      ++ U.cc
        []
  show ChatReportReasonChildAbuse =
    "ChatReportReasonChildAbuse"
      ++ U.cc
        []
  show ChatReportReasonCopyright =
    "ChatReportReasonCopyright"
      ++ U.cc
        []
  show ChatReportReasonUnrelatedLocation =
    "ChatReportReasonUnrelatedLocation"
      ++ U.cc
        []
  show ChatReportReasonFake =
    "ChatReportReasonFake"
      ++ U.cc
        []
  show ChatReportReasonIllegalDrugs =
    "ChatReportReasonIllegalDrugs"
      ++ U.cc
        []
  show ChatReportReasonPersonalDetails =
    "ChatReportReasonPersonalDetails"
      ++ U.cc
        []
  show ChatReportReasonCustom =
    "ChatReportReasonCustom"
      ++ U.cc
        []

instance T.FromJSON ChatReportReason where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatReportReasonSpam" -> parseChatReportReasonSpam v
      "chatReportReasonViolence" -> parseChatReportReasonViolence v
      "chatReportReasonPornography" -> parseChatReportReasonPornography v
      "chatReportReasonChildAbuse" -> parseChatReportReasonChildAbuse v
      "chatReportReasonCopyright" -> parseChatReportReasonCopyright v
      "chatReportReasonUnrelatedLocation" -> parseChatReportReasonUnrelatedLocation v
      "chatReportReasonFake" -> parseChatReportReasonFake v
      "chatReportReasonIllegalDrugs" -> parseChatReportReasonIllegalDrugs v
      "chatReportReasonPersonalDetails" -> parseChatReportReasonPersonalDetails v
      "chatReportReasonCustom" -> parseChatReportReasonCustom v
      _ -> mempty
    where
      parseChatReportReasonSpam :: A.Value -> T.Parser ChatReportReason
      parseChatReportReasonSpam = A.withObject "ChatReportReasonSpam" $ \o -> do
        return $ ChatReportReasonSpam {}

      parseChatReportReasonViolence :: A.Value -> T.Parser ChatReportReason
      parseChatReportReasonViolence = A.withObject "ChatReportReasonViolence" $ \o -> do
        return $ ChatReportReasonViolence {}

      parseChatReportReasonPornography :: A.Value -> T.Parser ChatReportReason
      parseChatReportReasonPornography = A.withObject "ChatReportReasonPornography" $ \o -> do
        return $ ChatReportReasonPornography {}

      parseChatReportReasonChildAbuse :: A.Value -> T.Parser ChatReportReason
      parseChatReportReasonChildAbuse = A.withObject "ChatReportReasonChildAbuse" $ \o -> do
        return $ ChatReportReasonChildAbuse {}

      parseChatReportReasonCopyright :: A.Value -> T.Parser ChatReportReason
      parseChatReportReasonCopyright = A.withObject "ChatReportReasonCopyright" $ \o -> do
        return $ ChatReportReasonCopyright {}

      parseChatReportReasonUnrelatedLocation :: A.Value -> T.Parser ChatReportReason
      parseChatReportReasonUnrelatedLocation = A.withObject "ChatReportReasonUnrelatedLocation" $ \o -> do
        return $ ChatReportReasonUnrelatedLocation {}

      parseChatReportReasonFake :: A.Value -> T.Parser ChatReportReason
      parseChatReportReasonFake = A.withObject "ChatReportReasonFake" $ \o -> do
        return $ ChatReportReasonFake {}

      parseChatReportReasonIllegalDrugs :: A.Value -> T.Parser ChatReportReason
      parseChatReportReasonIllegalDrugs = A.withObject "ChatReportReasonIllegalDrugs" $ \o -> do
        return $ ChatReportReasonIllegalDrugs {}

      parseChatReportReasonPersonalDetails :: A.Value -> T.Parser ChatReportReason
      parseChatReportReasonPersonalDetails = A.withObject "ChatReportReasonPersonalDetails" $ \o -> do
        return $ ChatReportReasonPersonalDetails {}

      parseChatReportReasonCustom :: A.Value -> T.Parser ChatReportReason
      parseChatReportReasonCustom = A.withObject "ChatReportReasonCustom" $ \o -> do
        return $ ChatReportReasonCustom {}
  parseJSON _ = mempty

instance T.ToJSON ChatReportReason where
  toJSON ChatReportReasonSpam =
    A.object
      [ "@type" A..= T.String "chatReportReasonSpam"
      ]
  toJSON ChatReportReasonViolence =
    A.object
      [ "@type" A..= T.String "chatReportReasonViolence"
      ]
  toJSON ChatReportReasonPornography =
    A.object
      [ "@type" A..= T.String "chatReportReasonPornography"
      ]
  toJSON ChatReportReasonChildAbuse =
    A.object
      [ "@type" A..= T.String "chatReportReasonChildAbuse"
      ]
  toJSON ChatReportReasonCopyright =
    A.object
      [ "@type" A..= T.String "chatReportReasonCopyright"
      ]
  toJSON ChatReportReasonUnrelatedLocation =
    A.object
      [ "@type" A..= T.String "chatReportReasonUnrelatedLocation"
      ]
  toJSON ChatReportReasonFake =
    A.object
      [ "@type" A..= T.String "chatReportReasonFake"
      ]
  toJSON ChatReportReasonIllegalDrugs =
    A.object
      [ "@type" A..= T.String "chatReportReasonIllegalDrugs"
      ]
  toJSON ChatReportReasonPersonalDetails =
    A.object
      [ "@type" A..= T.String "chatReportReasonPersonalDetails"
      ]
  toJSON ChatReportReasonCustom =
    A.object
      [ "@type" A..= T.String "chatReportReasonCustom"
      ]

-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatReportReason where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Describes the reason why a chat is reported
data ChatReportReason = 
 ChatReportReasonSpam 
 | ChatReportReasonViolence 
 | ChatReportReasonPornography 
 | ChatReportReasonChildAbuse 
 | ChatReportReasonCopyright 
 | ChatReportReasonUnrelatedLocation 
 | ChatReportReasonCustom { text :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON ChatReportReason where
 toJSON (ChatReportReasonSpam {  }) =
  A.object [ "@type" A..= T.String "chatReportReasonSpam" ]

 toJSON (ChatReportReasonViolence {  }) =
  A.object [ "@type" A..= T.String "chatReportReasonViolence" ]

 toJSON (ChatReportReasonPornography {  }) =
  A.object [ "@type" A..= T.String "chatReportReasonPornography" ]

 toJSON (ChatReportReasonChildAbuse {  }) =
  A.object [ "@type" A..= T.String "chatReportReasonChildAbuse" ]

 toJSON (ChatReportReasonCopyright {  }) =
  A.object [ "@type" A..= T.String "chatReportReasonCopyright" ]

 toJSON (ChatReportReasonUnrelatedLocation {  }) =
  A.object [ "@type" A..= T.String "chatReportReasonUnrelatedLocation" ]

 toJSON (ChatReportReasonCustom { text = text }) =
  A.object [ "@type" A..= T.String "chatReportReasonCustom", "text" A..= text ]

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
   "chatReportReasonCustom" -> parseChatReportReasonCustom v
   _ -> mempty
  where
   parseChatReportReasonSpam :: A.Value -> T.Parser ChatReportReason
   parseChatReportReasonSpam = A.withObject "ChatReportReasonSpam" $ \o -> do
    return $ ChatReportReasonSpam {  }

   parseChatReportReasonViolence :: A.Value -> T.Parser ChatReportReason
   parseChatReportReasonViolence = A.withObject "ChatReportReasonViolence" $ \o -> do
    return $ ChatReportReasonViolence {  }

   parseChatReportReasonPornography :: A.Value -> T.Parser ChatReportReason
   parseChatReportReasonPornography = A.withObject "ChatReportReasonPornography" $ \o -> do
    return $ ChatReportReasonPornography {  }

   parseChatReportReasonChildAbuse :: A.Value -> T.Parser ChatReportReason
   parseChatReportReasonChildAbuse = A.withObject "ChatReportReasonChildAbuse" $ \o -> do
    return $ ChatReportReasonChildAbuse {  }

   parseChatReportReasonCopyright :: A.Value -> T.Parser ChatReportReason
   parseChatReportReasonCopyright = A.withObject "ChatReportReasonCopyright" $ \o -> do
    return $ ChatReportReasonCopyright {  }

   parseChatReportReasonUnrelatedLocation :: A.Value -> T.Parser ChatReportReason
   parseChatReportReasonUnrelatedLocation = A.withObject "ChatReportReasonUnrelatedLocation" $ \o -> do
    return $ ChatReportReasonUnrelatedLocation {  }

   parseChatReportReasonCustom :: A.Value -> T.Parser ChatReportReason
   parseChatReportReasonCustom = A.withObject "ChatReportReasonCustom" $ \o -> do
    text <- o A..:? "text"
    return $ ChatReportReasonCustom { text = text }
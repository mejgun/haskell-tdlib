-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatReportReason where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ChatReportReason = 
 ChatReportReasonSpam 
 | ChatReportReasonViolence 
 | ChatReportReasonPornography 
 | ChatReportReasonChildAbuse 
 | ChatReportReasonCopyright 
 | ChatReportReasonUnrelatedLocation 
 | ChatReportReasonCustom { text :: String }  -- deriving (Show)

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
-- chatReportReasonSpam ChatReportReason 

-- chatReportReasonViolence ChatReportReason 

-- chatReportReasonPornography ChatReportReason 

-- chatReportReasonChildAbuse ChatReportReason 

-- chatReportReasonCopyright ChatReportReason 

-- chatReportReasonUnrelatedLocation ChatReportReason 

-- chatReportReasonCustom ChatReportReason  { text :: String } 


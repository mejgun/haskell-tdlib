-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatActionBar where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ChatActionBar = 
 ChatActionBarReportSpam 
 | ChatActionBarReportUnrelatedLocation 
 | ChatActionBarReportAddBlock 
 | ChatActionBarAddContact 
 | ChatActionBarSharePhoneNumber -- deriving (Show)

instance T.ToJSON ChatActionBar where
 toJSON (ChatActionBarReportSpam {  }) =
  A.object [ "@type" A..= T.String "chatActionBarReportSpam" ]

 toJSON (ChatActionBarReportUnrelatedLocation {  }) =
  A.object [ "@type" A..= T.String "chatActionBarReportUnrelatedLocation" ]

 toJSON (ChatActionBarReportAddBlock {  }) =
  A.object [ "@type" A..= T.String "chatActionBarReportAddBlock" ]

 toJSON (ChatActionBarAddContact {  }) =
  A.object [ "@type" A..= T.String "chatActionBarAddContact" ]

 toJSON (ChatActionBarSharePhoneNumber {  }) =
  A.object [ "@type" A..= T.String "chatActionBarSharePhoneNumber" ]
-- chatActionBarReportSpam ChatActionBar 

-- chatActionBarReportUnrelatedLocation ChatActionBar 

-- chatActionBarReportAddBlock ChatActionBar 

-- chatActionBarAddContact ChatActionBar 

-- chatActionBarSharePhoneNumber ChatActionBar 


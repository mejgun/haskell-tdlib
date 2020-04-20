-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallDiscardReason where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CallDiscardReason = 
 CallDiscardReasonEmpty 
 | CallDiscardReasonMissed 
 | CallDiscardReasonDeclined 
 | CallDiscardReasonDisconnected 
 | CallDiscardReasonHungUp -- deriving (Show)

instance T.ToJSON CallDiscardReason where
 toJSON (CallDiscardReasonEmpty {  }) =
  A.object [ "@type" A..= T.String "callDiscardReasonEmpty" ]

 toJSON (CallDiscardReasonMissed {  }) =
  A.object [ "@type" A..= T.String "callDiscardReasonMissed" ]

 toJSON (CallDiscardReasonDeclined {  }) =
  A.object [ "@type" A..= T.String "callDiscardReasonDeclined" ]

 toJSON (CallDiscardReasonDisconnected {  }) =
  A.object [ "@type" A..= T.String "callDiscardReasonDisconnected" ]

 toJSON (CallDiscardReasonHungUp {  }) =
  A.object [ "@type" A..= T.String "callDiscardReasonHungUp" ]
-- callDiscardReasonEmpty CallDiscardReason 

-- callDiscardReasonMissed CallDiscardReason 

-- callDiscardReasonDeclined CallDiscardReason 

-- callDiscardReasonDisconnected CallDiscardReason 

-- callDiscardReasonHungUp CallDiscardReason 


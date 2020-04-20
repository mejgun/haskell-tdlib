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



instance T.FromJSON CallDiscardReason where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "callDiscardReasonEmpty" -> parseCallDiscardReasonEmpty v
   "callDiscardReasonMissed" -> parseCallDiscardReasonMissed v
   "callDiscardReasonDeclined" -> parseCallDiscardReasonDeclined v
   "callDiscardReasonDisconnected" -> parseCallDiscardReasonDisconnected v
   "callDiscardReasonHungUp" -> parseCallDiscardReasonHungUp v
  where
   parseCallDiscardReasonEmpty :: A.Value -> T.Parser CallDiscardReason
   parseCallDiscardReasonEmpty = A.withObject "CallDiscardReasonEmpty" $ \o -> do
    return $ CallDiscardReasonEmpty {  }

   parseCallDiscardReasonMissed :: A.Value -> T.Parser CallDiscardReason
   parseCallDiscardReasonMissed = A.withObject "CallDiscardReasonMissed" $ \o -> do
    return $ CallDiscardReasonMissed {  }

   parseCallDiscardReasonDeclined :: A.Value -> T.Parser CallDiscardReason
   parseCallDiscardReasonDeclined = A.withObject "CallDiscardReasonDeclined" $ \o -> do
    return $ CallDiscardReasonDeclined {  }

   parseCallDiscardReasonDisconnected :: A.Value -> T.Parser CallDiscardReason
   parseCallDiscardReasonDisconnected = A.withObject "CallDiscardReasonDisconnected" $ \o -> do
    return $ CallDiscardReasonDisconnected {  }

   parseCallDiscardReasonHungUp :: A.Value -> T.Parser CallDiscardReason
   parseCallDiscardReasonHungUp = A.withObject "CallDiscardReasonHungUp" $ \o -> do
    return $ CallDiscardReasonHungUp {  }
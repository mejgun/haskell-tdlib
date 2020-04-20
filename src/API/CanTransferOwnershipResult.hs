-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CanTransferOwnershipResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CanTransferOwnershipResult = 
 CanTransferOwnershipResultOk 
 | CanTransferOwnershipResultPasswordNeeded 
 | CanTransferOwnershipResultPasswordTooFresh { retry_after :: Int }  
 | CanTransferOwnershipResultSessionTooFresh { retry_after :: Int }  -- deriving (Show)

instance T.ToJSON CanTransferOwnershipResult where
 toJSON (CanTransferOwnershipResultOk {  }) =
  A.object [ "@type" A..= T.String "canTransferOwnershipResultOk" ]

 toJSON (CanTransferOwnershipResultPasswordNeeded {  }) =
  A.object [ "@type" A..= T.String "canTransferOwnershipResultPasswordNeeded" ]

 toJSON (CanTransferOwnershipResultPasswordTooFresh { retry_after = retry_after }) =
  A.object [ "@type" A..= T.String "canTransferOwnershipResultPasswordTooFresh", "retry_after" A..= retry_after ]

 toJSON (CanTransferOwnershipResultSessionTooFresh { retry_after = retry_after }) =
  A.object [ "@type" A..= T.String "canTransferOwnershipResultSessionTooFresh", "retry_after" A..= retry_after ]
-- canTransferOwnershipResultOk CanTransferOwnershipResult 

-- canTransferOwnershipResultPasswordNeeded CanTransferOwnershipResult 

-- canTransferOwnershipResultPasswordTooFresh CanTransferOwnershipResult  { retry_after :: Int } 

-- canTransferOwnershipResultSessionTooFresh CanTransferOwnershipResult  { retry_after :: Int } 


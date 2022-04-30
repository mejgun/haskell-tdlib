-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CancelPasswordReset where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Cancels reset of 2-step verification password. The method can be called if passwordState.pending_reset_date > 0
data CancelPasswordReset = 

 CancelPasswordReset deriving (Eq)

instance Show CancelPasswordReset where
 show CancelPasswordReset {  } =
  "CancelPasswordReset" ++ U.cc [ ]

instance T.ToJSON CancelPasswordReset where
 toJSON CancelPasswordReset {  } =
  A.object [ "@type" A..= T.String "cancelPasswordReset" ]

instance T.FromJSON CancelPasswordReset where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "cancelPasswordReset" -> parseCancelPasswordReset v
   _ -> mempty
  where
   parseCancelPasswordReset :: A.Value -> T.Parser CancelPasswordReset
   parseCancelPasswordReset = A.withObject "CancelPasswordReset" $ \o -> do
    return $ CancelPasswordReset {  }
 parseJSON _ = mempty

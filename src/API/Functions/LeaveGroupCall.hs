-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.LeaveGroupCall where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Leaves a group call 
-- 
-- __group_call_id__ Group call identifier
data LeaveGroupCall = 

 LeaveGroupCall { group_call_id :: Maybe Int }  deriving (Eq)

instance Show LeaveGroupCall where
 show LeaveGroupCall { group_call_id=group_call_id } =
  "LeaveGroupCall" ++ U.cc [U.p "group_call_id" group_call_id ]

instance T.ToJSON LeaveGroupCall where
 toJSON LeaveGroupCall { group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "leaveGroupCall", "group_call_id" A..= group_call_id ]

instance T.FromJSON LeaveGroupCall where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "leaveGroupCall" -> parseLeaveGroupCall v
   _ -> mempty
  where
   parseLeaveGroupCall :: A.Value -> T.Parser LeaveGroupCall
   parseLeaveGroupCall = A.withObject "LeaveGroupCall" $ \o -> do
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ LeaveGroupCall { group_call_id = group_call_id }
 parseJSON _ = mempty

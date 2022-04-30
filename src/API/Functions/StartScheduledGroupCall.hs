-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.StartScheduledGroupCall where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Starts a scheduled group call 
-- 
-- __group_call_id__ Group call identifier
data StartScheduledGroupCall = 

 StartScheduledGroupCall { group_call_id :: Maybe Int }  deriving (Eq)

instance Show StartScheduledGroupCall where
 show StartScheduledGroupCall { group_call_id=group_call_id } =
  "StartScheduledGroupCall" ++ U.cc [U.p "group_call_id" group_call_id ]

instance T.ToJSON StartScheduledGroupCall where
 toJSON StartScheduledGroupCall { group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "startScheduledGroupCall", "group_call_id" A..= group_call_id ]

instance T.FromJSON StartScheduledGroupCall where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "startScheduledGroupCall" -> parseStartScheduledGroupCall v
   _ -> mempty
  where
   parseStartScheduledGroupCall :: A.Value -> T.Parser StartScheduledGroupCall
   parseStartScheduledGroupCall = A.withObject "StartScheduledGroupCall" $ \o -> do
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ StartScheduledGroupCall { group_call_id = group_call_id }
 parseJSON _ = mempty

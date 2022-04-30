-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EndGroupCall where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Ends a group call. Requires groupCall.can_be_managed 
-- 
-- __group_call_id__ Group call identifier
data EndGroupCall = 

 EndGroupCall { group_call_id :: Maybe Int }  deriving (Eq)

instance Show EndGroupCall where
 show EndGroupCall { group_call_id=group_call_id } =
  "EndGroupCall" ++ U.cc [U.p "group_call_id" group_call_id ]

instance T.ToJSON EndGroupCall where
 toJSON EndGroupCall { group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "endGroupCall", "group_call_id" A..= group_call_id ]

instance T.FromJSON EndGroupCall where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "endGroupCall" -> parseEndGroupCall v
   _ -> mempty
  where
   parseEndGroupCall :: A.Value -> T.Parser EndGroupCall
   parseEndGroupCall = A.withObject "EndGroupCall" $ \o -> do
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ EndGroupCall { group_call_id = group_call_id }
 parseJSON _ = mempty

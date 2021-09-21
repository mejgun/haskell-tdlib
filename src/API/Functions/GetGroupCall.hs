-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetGroupCall where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns information about a group call 
-- 
-- __group_call_id__ Group call identifier
data GetGroupCall = 

 GetGroupCall { group_call_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetGroupCall where
 toJSON (GetGroupCall { group_call_id = group_call_id }) =
  A.object [ "@type" A..= T.String "getGroupCall", "group_call_id" A..= group_call_id ]

instance T.FromJSON GetGroupCall where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getGroupCall" -> parseGetGroupCall v
   _ -> mempty
  where
   parseGetGroupCall :: A.Value -> T.Parser GetGroupCall
   parseGetGroupCall = A.withObject "GetGroupCall" $ \o -> do
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetGroupCall { group_call_id = group_call_id }
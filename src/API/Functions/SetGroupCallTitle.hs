-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetGroupCallTitle where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Sets group call title. Requires groupCall.can_be_managed group call flag 
-- 
-- __group_call_id__ Group call identifier
-- 
-- __title__ New group call title; 1-64 characters
data SetGroupCallTitle = 

 SetGroupCallTitle { title :: Maybe String, group_call_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetGroupCallTitle where
 toJSON (SetGroupCallTitle { title = title, group_call_id = group_call_id }) =
  A.object [ "@type" A..= T.String "setGroupCallTitle", "title" A..= title, "group_call_id" A..= group_call_id ]

instance T.FromJSON SetGroupCallTitle where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setGroupCallTitle" -> parseSetGroupCallTitle v
   _ -> mempty
  where
   parseSetGroupCallTitle :: A.Value -> T.Parser SetGroupCallTitle
   parseSetGroupCallTitle = A.withObject "SetGroupCallTitle" $ \o -> do
    title <- o A..:? "title"
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetGroupCallTitle { title = title, group_call_id = group_call_id }
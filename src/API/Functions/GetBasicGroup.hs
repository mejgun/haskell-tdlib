-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetBasicGroup where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns information about a basic group by its identifier. This is an offline request if the current user is not a bot 
-- 
-- __basic_group_id__ Basic group identifier
data GetBasicGroup = 
 GetBasicGroup { basic_group_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetBasicGroup where
 toJSON (GetBasicGroup { basic_group_id = basic_group_id }) =
  A.object [ "@type" A..= T.String "getBasicGroup", "basic_group_id" A..= basic_group_id ]

instance T.FromJSON GetBasicGroup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getBasicGroup" -> parseGetBasicGroup v
   _ -> mempty
  where
   parseGetBasicGroup :: A.Value -> T.Parser GetBasicGroup
   parseGetBasicGroup = A.withObject "GetBasicGroup" $ \o -> do
    basic_group_id <- mconcat [ o A..:? "basic_group_id", readMaybe <$> (o A..: "basic_group_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetBasicGroup { basic_group_id = basic_group_id }
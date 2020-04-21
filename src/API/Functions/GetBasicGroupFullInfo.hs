-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetBasicGroupFullInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetBasicGroupFullInfo = 
 GetBasicGroupFullInfo { basic_group_id :: Int }  deriving (Show)

instance T.ToJSON GetBasicGroupFullInfo where
 toJSON (GetBasicGroupFullInfo { basic_group_id = basic_group_id }) =
  A.object [ "@type" A..= T.String "getBasicGroupFullInfo", "basic_group_id" A..= basic_group_id ]

instance T.FromJSON GetBasicGroupFullInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getBasicGroupFullInfo" -> parseGetBasicGroupFullInfo v
   _ -> mempty
  where
   parseGetBasicGroupFullInfo :: A.Value -> T.Parser GetBasicGroupFullInfo
   parseGetBasicGroupFullInfo = A.withObject "GetBasicGroupFullInfo" $ \o -> do
    basic_group_id <- o A..: "basic_group_id"
    return $ GetBasicGroupFullInfo { basic_group_id = basic_group_id }
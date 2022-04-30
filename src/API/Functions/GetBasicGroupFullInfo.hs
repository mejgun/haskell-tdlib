-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetBasicGroupFullInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns full information about a basic group by its identifier 
-- 
-- __basic_group_id__ Basic group identifier
data GetBasicGroupFullInfo = 

 GetBasicGroupFullInfo { basic_group_id :: Maybe Int }  deriving (Eq)

instance Show GetBasicGroupFullInfo where
 show GetBasicGroupFullInfo { basic_group_id=basic_group_id } =
  "GetBasicGroupFullInfo" ++ U.cc [U.p "basic_group_id" basic_group_id ]

instance T.ToJSON GetBasicGroupFullInfo where
 toJSON GetBasicGroupFullInfo { basic_group_id = basic_group_id } =
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
    basic_group_id <- mconcat [ o A..:? "basic_group_id", readMaybe <$> (o A..: "basic_group_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetBasicGroupFullInfo { basic_group_id = basic_group_id }
 parseJSON _ = mempty

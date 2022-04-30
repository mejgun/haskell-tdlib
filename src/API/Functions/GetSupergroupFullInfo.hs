-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSupergroupFullInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns full information about a supergroup or a channel by its identifier, cached for up to 1 minute 
-- 
-- __supergroup_id__ Supergroup or channel identifier
data GetSupergroupFullInfo = 

 GetSupergroupFullInfo { supergroup_id :: Maybe Int }  deriving (Eq)

instance Show GetSupergroupFullInfo where
 show GetSupergroupFullInfo { supergroup_id=supergroup_id } =
  "GetSupergroupFullInfo" ++ U.cc [U.p "supergroup_id" supergroup_id ]

instance T.ToJSON GetSupergroupFullInfo where
 toJSON GetSupergroupFullInfo { supergroup_id = supergroup_id } =
  A.object [ "@type" A..= T.String "getSupergroupFullInfo", "supergroup_id" A..= supergroup_id ]

instance T.FromJSON GetSupergroupFullInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSupergroupFullInfo" -> parseGetSupergroupFullInfo v
   _ -> mempty
  where
   parseGetSupergroupFullInfo :: A.Value -> T.Parser GetSupergroupFullInfo
   parseGetSupergroupFullInfo = A.withObject "GetSupergroupFullInfo" $ \o -> do
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetSupergroupFullInfo { supergroup_id = supergroup_id }
 parseJSON _ = mempty

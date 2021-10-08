-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetUserFullInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns full information about a user by their identifier 
-- 
-- __user_id__ User identifier
data GetUserFullInfo = 

 GetUserFullInfo { user_id :: Maybe Int }  deriving (Eq)

instance Show GetUserFullInfo where
 show GetUserFullInfo { user_id=user_id } =
  "GetUserFullInfo" ++ cc [p "user_id" user_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetUserFullInfo where
 toJSON GetUserFullInfo { user_id = user_id } =
  A.object [ "@type" A..= T.String "getUserFullInfo", "user_id" A..= user_id ]

instance T.FromJSON GetUserFullInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getUserFullInfo" -> parseGetUserFullInfo v
   _ -> mempty
  where
   parseGetUserFullInfo :: A.Value -> T.Parser GetUserFullInfo
   parseGetUserFullInfo = A.withObject "GetUserFullInfo" $ \o -> do
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetUserFullInfo { user_id = user_id }
 parseJSON _ = mempty

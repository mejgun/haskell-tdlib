-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSupergroup where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns information about a supergroup or a channel by its identifier. This is an offline request if the current user is not a bot 
-- 
-- __supergroup_id__ Supergroup or channel identifier
data GetSupergroup = 

 GetSupergroup { supergroup_id :: Maybe Int }  deriving (Eq)

instance Show GetSupergroup where
 show GetSupergroup { supergroup_id=supergroup_id } =
  "GetSupergroup" ++ cc [p "supergroup_id" supergroup_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetSupergroup where
 toJSON GetSupergroup { supergroup_id = supergroup_id } =
  A.object [ "@type" A..= T.String "getSupergroup", "supergroup_id" A..= supergroup_id ]

instance T.FromJSON GetSupergroup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSupergroup" -> parseGetSupergroup v
   _ -> mempty
  where
   parseGetSupergroup :: A.Value -> T.Parser GetSupergroup
   parseGetSupergroup = A.withObject "GetSupergroup" $ \o -> do
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetSupergroup { supergroup_id = supergroup_id }
 parseJSON _ = mempty

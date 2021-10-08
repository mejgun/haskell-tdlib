-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteAllCallMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Deletes all call messages 
-- 
-- __revoke__ Pass true to delete the messages for all users
data DeleteAllCallMessages = 

 DeleteAllCallMessages { revoke :: Maybe Bool }  deriving (Eq)

instance Show DeleteAllCallMessages where
 show DeleteAllCallMessages { revoke=revoke } =
  "DeleteAllCallMessages" ++ cc [p "revoke" revoke ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON DeleteAllCallMessages where
 toJSON DeleteAllCallMessages { revoke = revoke } =
  A.object [ "@type" A..= T.String "deleteAllCallMessages", "revoke" A..= revoke ]

instance T.FromJSON DeleteAllCallMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteAllCallMessages" -> parseDeleteAllCallMessages v
   _ -> mempty
  where
   parseDeleteAllCallMessages :: A.Value -> T.Parser DeleteAllCallMessages
   parseDeleteAllCallMessages = A.withObject "DeleteAllCallMessages" $ \o -> do
    revoke <- o A..:? "revoke"
    return $ DeleteAllCallMessages { revoke = revoke }
 parseJSON _ = mempty

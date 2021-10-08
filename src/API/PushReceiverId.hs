-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PushReceiverId where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains a globally unique push receiver identifier, which can be used to identify which account has received a push notification 
-- 
-- __id__ The globally unique identifier of push notification subscription
data PushReceiverId = 

 PushReceiverId { _id :: Maybe Int }  deriving (Eq)

instance Show PushReceiverId where
 show PushReceiverId { _id=_id } =
  "PushReceiverId" ++ cc [p "_id" _id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON PushReceiverId where
 toJSON PushReceiverId { _id = _id } =
  A.object [ "@type" A..= T.String "pushReceiverId", "id" A..= _id ]

instance T.FromJSON PushReceiverId where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "pushReceiverId" -> parsePushReceiverId v
   _ -> mempty
  where
   parsePushReceiverId :: A.Value -> T.Parser PushReceiverId
   parsePushReceiverId = A.withObject "PushReceiverId" $ \o -> do
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ PushReceiverId { _id = _id }
 parseJSON _ = mempty
